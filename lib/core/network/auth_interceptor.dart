import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import 'access_token_provider.dart';

/// Attaches the Frontier bearer token and transparently refreshes it once on a
/// 401.
///
/// A single-flight [Completer] guards the refresh so that a burst of parallel
/// requests triggers exactly one token exchange.
class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor(this._tokenProvider);

  final AccessTokenProvider _tokenProvider;
  Completer<String?>? _inFlightRefresh;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? token = await _tokenProvider.currentAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final bool isAuthError =
        err.response?.statusCode == HttpStatus.unauthorized ||
            err.response?.statusCode == HttpStatus.forbidden;
    final bool alreadyRetried = err.requestOptions.extra['ed_retried'] == true;

    if (!isAuthError || alreadyRetried) {
      handler.next(err);
      return;
    }

    final String? refreshed = await _refreshOnce();
    if (refreshed == null) {
      await _tokenProvider.onSessionLost();
      handler.next(err);
      return;
    }

    final RequestOptions retry = err.requestOptions
      ..extra['ed_retried'] = true
      ..headers[HttpHeaders.authorizationHeader] = 'Bearer $refreshed';

    try {
      final Dio dio = Dio(BaseOptions(baseUrl: retry.baseUrl));
      final Response<dynamic> response = await dio.fetch<dynamic>(retry);
      handler.resolve(response);
    } on DioException catch (retryError) {
      handler.next(retryError);
    }
  }

  Future<String?> _refreshOnce() {
    final Completer<String?>? pending = _inFlightRefresh;
    if (pending != null) {
      return pending.future;
    }
    final Completer<String?> completer = Completer<String?>();
    _inFlightRefresh = completer;
    unawaited(
      _tokenProvider.refreshAccessToken().then(
        completer.complete,
        onError: (Object _) => completer.complete(null),
      ).whenComplete(() => _inFlightRefresh = null),
    );
    return completer.future;
  }
}
