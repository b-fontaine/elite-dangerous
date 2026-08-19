import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../time/clock.dart';
import 'access_token_provider.dart';
import 'app_identity.dart';
import 'auth_interceptor.dart';
import 'capi_throttle_interceptor.dart';
import 'frontier_endpoints.dart';
import 'retry_interceptor.dart';

/// The two HTTP clients this app needs.
///
/// They are kept separate on purpose: the authorisation server must never see
/// an `Authorization` header from the interceptor, otherwise a refresh
/// triggered by a 401 would recurse into itself.
@module
abstract class NetworkModule {
  /// Talks to `auth.frontierstore.net`. No auth interceptor.
  @Named('frontierAuth')
  @lazySingleton
  Dio frontierAuthDio() => Dio(
        BaseOptions(
          baseUrl: FrontierEndpoints.authBaseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: <String, String>{'User-Agent': AppIdentity.userAgent},
        ),
      )..interceptors.add(RetryInterceptor());

  /// Talks to `companion.orerve.net`. Carries the bearer token, refreshes it
  /// once on a 401, and respects Frontier's one-query-per-minute budget.
  @Named('frontierApi')
  @lazySingleton
  Dio frontierApiDio(AccessTokenProvider tokenProvider, Clock clock) => Dio(
        BaseOptions(
          baseUrl: FrontierEndpoints.apiBaseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 60),
          headers: <String, String>{
            'User-Agent': AppIdentity.userAgent,
            'Content-Type': 'application/json',
          },
          // Frontier uses 204 (not played that day) and 206 (partial journal)
          // as meaningful answers, so they must reach the data source.
          validateStatus: (int? status) => status != null && status < 400,
        ),
      )..interceptors.addAll(<Interceptor>[
          CapiThrottleInterceptor(clock),
          AuthInterceptor(tokenProvider),
          RetryInterceptor(),
        ]);
}
