import 'dart:async';

import 'package:dio/dio.dart';

import '../time/clock.dart';

/// Enforces Frontier's request budget.
///
/// The Companion API is explicitly not a real-time service: Frontier asks for
/// no more than roughly one query per minute, and has said rate limiting kicks
/// in past two queries per second. Rather than trusting every call site to
/// remember that, the rule lives here — requests that arrive too early are
/// delayed, not dropped, so a caller never has to handle a synthetic error.
class CapiThrottleInterceptor extends QueuedInterceptor {
  CapiThrottleInterceptor(this._clock, {this.minimumInterval = _defaultInterval});

  static const Duration _defaultInterval = Duration(seconds: 60);

  /// Endpoints Frontier throttles far harder than the rest.
  static const Duration fleetCarrierInterval = Duration(minutes: 15);

  final Clock _clock;
  final Duration minimumInterval;

  final Map<String, DateTime> _lastCallByPath = <String, DateTime>{};

  /// Marks a request as exempt from throttling, for a user-initiated refresh
  /// the commander is actively waiting on.
  static const String bypassKey = 'capi_bypass_throttle';

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra[bypassKey] == true) {
      handler.next(options);
      return;
    }

    final String path = options.path;
    final Duration interval = path.contains('fleetcarrier')
        ? fleetCarrierInterval
        : minimumInterval;
    final DateTime? last = _lastCallByPath[path];
    final DateTime now = _clock.now();

    if (last != null) {
      final Duration elapsed = now.difference(last);
      if (elapsed < interval) {
        await Future<void>.delayed(interval - elapsed);
      }
    }
    _lastCallByPath[path] = _clock.now();
    handler.next(options);
  }
}
