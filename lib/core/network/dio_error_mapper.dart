import 'dart:io';

import 'package:dio/dio.dart';

import '../error/failure.dart';

/// Translates Dio's exception taxonomy into domain [Failure]s.
///
/// Keeping this in one place means no repository ever has to know what a
/// `DioException` is.
///
/// [service] names the host in the messages the commander reads. It matters:
/// "Frontier ne répond pas" while the app is in fact waiting on Spansh sends
/// someone off to check their game login for nothing.
Failure mapDioError(
  Object error, [
  StackTrace? stackTrace,
  String service = 'Frontier',
]) {
  if (error is! DioException) {
    if (error is SocketException) {
      return NetworkFailure(cause: error);
    }
    if (error is FormatException) {
      return ParsingFailure(cause: error);
    }
    return UnexpectedFailure(message: error.toString(), cause: error);
  }

  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.transformTimeout:
      return NetworkFailure(
        message: '$service ne répond pas (délai dépassé).',
        cause: error,
      );
    case DioExceptionType.connectionError:
    case DioExceptionType.unknown:
      return NetworkFailure(cause: error);
    case DioExceptionType.cancel:
      return CancelledFailure(cause: error);
    case DioExceptionType.badCertificate:
      return NetworkFailure(
        message: 'Certificat TLS refusé par le client.',
        cause: error,
      );
    case DioExceptionType.badResponse:
      return _mapStatus(error, service);
  }
}

Failure _mapStatus(DioException error, String service) {
  final int status = error.response?.statusCode ?? 0;
  if (status == HttpStatus.unauthorized || status == HttpStatus.forbidden) {
    return UnauthorizedFailure(cause: error);
  }
  if (status == HttpStatus.notFound) {
    return NotFoundFailure(cause: error);
  }
  if (status == HttpStatus.tooManyRequests) {
    return RateLimitFailure(
      message: 'Trop de requêtes vers $service. '
          'Réessaie dans quelques minutes.',
      cause: error,
      retryAfter: _retryAfter(error.response?.headers),
    );
  }
  if (status >= 500) {
    return ServerFailure(cause: error, statusCode: status);
  }
  return ServerFailure(
    message: 'Réponse inattendue de $service (HTTP $status).',
    cause: error,
    statusCode: status,
  );
}

Duration? _retryAfter(Headers? headers) {
  final String? raw = headers?.value(HttpHeaders.retryAfterHeader);
  final int? seconds = raw == null ? null : int.tryParse(raw);
  return seconds == null ? null : Duration(seconds: seconds);
}
