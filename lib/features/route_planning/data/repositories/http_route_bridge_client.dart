import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../../../core/result/result.dart';
import '../../../../core/storage/key_value_store.dart';
import '../../../../core/storage/storage_keys.dart';
import '../../domain/repositories/route_bridge.dart';

/// Reads the game machine from a second screen.
///
/// Its own `Dio`, built per request rather than injected: the target is a
/// address on the commander's own network that changes with the pairing, and
/// none of the app's other clients — Frontier's throttle, Spansh's courtesy
/// delay, EDSM's quota — mean anything against a machine in the next room.
@LazySingleton(as: RouteBridgeClient)
class HttpRouteBridgeClient implements RouteBridgeClient {
  const HttpRouteBridgeClient(this._store);

  final KeyValueStore _store;

  /// Short on purpose. A host that is off should say so in a couple of seconds,
  /// not leave the screen spinning: "the PC is asleep" is the common case here,
  /// not a slow network.
  static const Duration timeout = Duration(seconds: 4);

  @override
  Future<BridgePairing?> pairing() async {
    final String? code = await _store.readString(StorageKeys.routeBridgePairing);
    return code == null ? null : BridgePairing.parse(code);
  }

  @override
  Future<void> pair(BridgePairing pairing) =>
      _store.writeString(StorageKeys.routeBridgePairing, pairing.code);

  @override
  Future<void> unpair() => _store.remove(StorageKeys.routeBridgePairing);

  @override
  Future<Result<Map<String, dynamic>>> fetchState() async {
    final BridgePairing? paired = await pairing();
    if (paired == null) {
      return const ResultFailure<Map<String, dynamic>>(
        NetworkFailure(message: 'Aucun appareil appairé.'),
      );
    }

    final Dio dio = Dio(
      BaseOptions(
        connectTimeout: timeout,
        receiveTimeout: timeout,
        // 204 means "paired and reachable, but no route being flown" — an
        // answer, not a failure, and it must reach the caller intact.
        validateStatus: (int? status) => status != null && status < 500,
      ),
    );

    try {
      return await guard<Map<String, dynamic>>(
        () async {
          final Response<dynamic> response = await dio.getUri<dynamic>(
            paired.stateUri,
          );
          if (response.statusCode == 403) {
            throw const FormatException(
              'Jeton refusé. Le partage a peut-être été relancé : '
              'reprendre le code affiché sur la machine de jeu.',
            );
          }
          if (response.statusCode == 204 || response.data == null) {
            return const <String, dynamic>{};
          }
          if (response.data case final Map<String, dynamic> json) {
            return json;
          }
          throw const FormatException(
            'La machine de jeu a répondu autre chose qu\'un état de route.',
          );
        },
        onError: (Object error, StackTrace stackTrace) {
          if (error is FormatException) {
            return ParsingFailure(message: error.message, cause: error);
          }
          return mapDioError(error, stackTrace, 'la machine de jeu');
        },
      );
    } finally {
      dio.close(force: true);
    }
  }
}
