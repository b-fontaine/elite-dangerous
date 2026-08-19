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
///
/// The budget is per *endpoint family*, not per URL. That distinction is the
/// whole point for `/journal`, which takes the day in its path: keying on the
/// full path would give every day its own fresh allowance and let a multi-day
/// sync leave as one uninterrupted burst — exactly what Frontier rate-limits.
class CapiThrottleInterceptor extends QueuedInterceptor {
  CapiThrottleInterceptor(this._clock, {this.minimumInterval = _defaultInterval});

  static const Duration _defaultInterval = Duration(seconds: 60);

  /// Endpoints Frontier throttles far harder than the rest.
  static const Duration fleetCarrierInterval = Duration(minutes: 15);

  /// `/journal/{day}` is the one endpoint meant to be called many times in a
  /// row: a day is a whole request, and the history worth having spans weeks.
  /// A minute apiece would make that unusable, so the family gets its own
  /// spacing — comfortably under the two-per-second Frontier rate-limits at,
  /// and still deliberate rather than a burst.
  static const Duration journalInterval = Duration(milliseconds: 1500);

  final Clock _clock;
  final Duration minimumInterval;

  final Map<String, DateTime> _lastCallByFamily = <String, DateTime>{};

  /// Marks a request as exempt from throttling, for a user-initiated refresh
  /// the commander is actively waiting on.
  static const String bypassKey = 'capi_bypass_throttle';

  /// Collapses `/journal/2026/08/19` onto `/journal`, and leaves every other
  /// path as its own family.
  static String familyOf(String path) =>
      path.startsWith('/journal') ? '/journal' : path;

  static Duration intervalFor(String family, Duration fallback) {
    if (family.contains('fleetcarrier')) {
      return fleetCarrierInterval;
    }
    if (family == '/journal') {
      return journalInterval;
    }
    return fallback;
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra[bypassKey] == true) {
      handler.next(options);
      return;
    }

    final String family = familyOf(options.path);
    final Duration interval = intervalFor(family, minimumInterval);
    final DateTime? last = _lastCallByFamily[family];
    final DateTime now = _clock.now();

    if (last != null) {
      final Duration elapsed = now.difference(last);
      if (elapsed < interval) {
        await Future<void>.delayed(interval - elapsed);
      }
    }
    _lastCallByFamily[family] = _clock.now();
    handler.next(options);
  }
}
