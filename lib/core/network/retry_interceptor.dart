import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

/// Retries the transient statuses Frontier is known to return, with an
/// exponential backoff — the same policy EDMC applies (429, 500, 502, 503, 504).
///
/// `418 I'm a teapot` means "service under maintenance" in Frontier's dialect
/// and is deliberately *not* retried: it lasts far longer than a backoff.
class RetryInterceptor extends Interceptor {
  RetryInterceptor({
    this.maxAttempts = 3,
    this.initialDelay = const Duration(milliseconds: 500),
  });

  final int maxAttempts;
  final Duration initialDelay;

  static const Set<int> retryableStatuses = <int>{429, 500, 502, 503, 504};
  static const String _attemptKey = 'retry_attempt';

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final int attempt = (err.requestOptions.extra[_attemptKey] as int?) ?? 0;
    final int? status = err.response?.statusCode;
    final bool retryable = status != null && retryableStatuses.contains(status);
    final bool transportError = err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout;

    if (attempt >= maxAttempts || !(retryable || transportError)) {
      handler.next(err);
      return;
    }

    final Duration delay = _delayFor(err, attempt);
    await Future<void>.delayed(delay);

    final RequestOptions options = err.requestOptions
      ..extra[_attemptKey] = attempt + 1;
    try {
      final Dio dio = Dio(BaseOptions(baseUrl: options.baseUrl));
      handler.resolve(await dio.fetch<dynamic>(options));
    } on DioException catch (retryError) {
      handler.next(retryError);
    }
  }

  Duration _delayFor(DioException err, int attempt) {
    final String? retryAfter =
        err.response?.headers.value(HttpHeaders.retryAfterHeader);
    final int? seconds = retryAfter == null ? null : int.tryParse(retryAfter);
    if (seconds != null) {
      return Duration(seconds: seconds);
    }
    return initialDelay * (1 << attempt);
  }
}
