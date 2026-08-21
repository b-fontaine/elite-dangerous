import 'dart:async';

import 'package:dio/dio.dart';

import '../time/clock.dart';

/// Spaces out requests to a host that never asked us to.
///
/// This is not the CAPI throttle: Frontier publishes a budget, and that
/// interceptor enforces it. Spansh publishes nothing — no terms of
/// service, no rate limit, only a note that it "does not *currently* enforce
/// any rate limits". Courtesy is therefore the only rule available, and the
/// only defensible reading of it is to behave like a single commander looking
/// things up rather than like a crawler.
///
/// One second between requests is slow enough to be obviously polite and fast
/// enough that fetching the species of six bodies still feels immediate.
class CourtesyThrottleInterceptor extends QueuedInterceptor {
  CourtesyThrottleInterceptor(
    this._clock, {
    this.minimumInterval = const Duration(seconds: 1),
  });

  final Clock _clock;
  final Duration minimumInterval;

  DateTime? _lastCall;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final DateTime? last = _lastCall;
    final DateTime now = _clock.now();

    if (last != null) {
      final Duration elapsed = now.difference(last);
      if (elapsed < minimumInterval) {
        await Future<void>.delayed(minimumInterval - elapsed);
      }
    }
    _lastCall = _clock.now();
    handler.next(options);
  }
}
