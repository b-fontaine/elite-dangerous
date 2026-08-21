import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../time/clock.dart';
import 'access_token_provider.dart';
import 'app_identity.dart';
import 'auth_interceptor.dart';
import 'capi_throttle_interceptor.dart';
import 'courtesy_throttle_interceptor.dart';
import 'frontier_endpoints.dart';
import 'retry_interceptor.dart';
import 'spansh_endpoints.dart';

/// The three HTTP clients this app needs.
///
/// They are kept separate on purpose. The authorisation server must never see
/// an `Authorization` header from the interceptor, otherwise a refresh
/// triggered by a 401 would recurse into itself. And Spansh must never see
/// Frontier's throttle: one query per minute is a rule Frontier published
/// about its own servers, and applying it to a third party would be both
/// pointless and unusable.
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

  /// Talks to `spansh.co.uk`. No credentials of any kind: the endpoints used
  /// are public and read-only, and nothing about the commander is sent.
  ///
  /// The receive timeout is generous because a populated system's dump runs to
  /// a couple of megabytes — Sol answers with 1.8 MB — and a commander on a
  /// hotel connection should still get an answer rather than a timeout.
  @Named('spansh')
  @lazySingleton
  Dio spanshDio(Clock clock) => Dio(
        BaseOptions(
          baseUrl: SpanshEndpoints.baseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 45),
          headers: <String, String>{
            'User-Agent': AppIdentity.userAgent,
            'Accept': 'application/json',
          },
        ),
      )..interceptors.addAll(<Interceptor>[
          CourtesyThrottleInterceptor(clock),
          RetryInterceptor(),
        ]);
}
