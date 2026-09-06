import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../../../core/time/clock.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/route_progress.dart';
import '../../domain/entities/route_state_envelope.dart';
import '../../domain/entities/session_pace.dart';
import '../../domain/repositories/route_bridge.dart';
import '../../domain/usecases/route_tracking_usecases.dart';
import '../models/route_state_codec.dart';

/// Serves the route being flown to other devices on the commander's network.
///
/// Deliberately **poll, not push**. A WebSocket would suggest a liveness this
/// data does not have: the game rewrites its files only when something changes,
/// and the app already re-reads them on a ten-second timer. Pushing an event
/// the instant a poll happened to notice a change adds a protocol without
/// adding a fact, and a socket that silently dies looks exactly like a game
/// where nothing is happening. A client asking every few seconds gets the same
/// freshness and can always say how old its answer is.
@LazySingleton(as: RouteBridgeHost)
class LocalRouteBridgeHost implements RouteBridgeHost {
  LocalRouteBridgeHost(this._track, this._measurePace, this._clock);

  final TrackActiveRoute _track;
  final MeasureSessionPace _measurePace;
  final Clock _clock;

  HttpServer? _server;
  BridgePairing? _pairing;

  @override
  bool get isSupported => !kIsWeb;

  @override
  bool get isRunning => _server != null;

  @override
  BridgePairing? get pairing => _pairing;

  @override
  Future<Result<BridgePairing>> start({
    int port = RouteBridgeHost.defaultPort,
  }) async {
    if (!isSupported) {
      return const ResultFailure<BridgePairing>(
        NetworkFailure(
          message: 'Un navigateur ne peut pas ouvrir de port. '
              'Lancer l\'application de bureau sur la machine de jeu.',
        ),
      );
    }
    await stop();

    return guard<BridgePairing>(
      () async {
        // anyIPv4, not loopback: the whole point is to be reachable from the
        // phone. That is also why this never starts on its own.
        final HttpServer server =
            await HttpServer.bind(InternetAddress.anyIPv4, port);
        _server = server;

        final BridgePairing pairing = BridgePairing(
          host: await _bestLocalAddress(),
          port: server.port,
          token: _newToken(),
        );
        _pairing = pairing;

        unawaited(
          server
              .forEach((HttpRequest request) => _handle(request, pairing))
              .catchError((Object _) {}),
        );

        return pairing;
      },
      onError: (Object error, StackTrace _) => NetworkFailure(
        message: error is SocketException
            ? 'Le port $port est déjà pris, ou le pare-feu le bloque.'
            : 'Impossible de démarrer le partage.',
        cause: error,
      ),
    );
  }

  @override
  Future<void> stop() async {
    await _server?.close(force: true);
    _server = null;
    _pairing = null;
  }

  Future<void> _handle(HttpRequest request, BridgePairing pairing) async {
    try {
      if (request.uri.path != '/state') {
        request.response
          ..statusCode = HttpStatus.ok
          ..headers.contentType = ContentType.html
          ..write(_landingPage());
        await request.response.close();
        return;
      }

      if (request.uri.queryParameters['token'] != pairing.token) {
        // 403 rather than 404: a wrong token is a fixable mistake, and saying
        // so beats letting the commander hunt for a typo in the address.
        request.response
          ..statusCode = HttpStatus.forbidden
          ..headers.contentType = ContentType.json
          ..write(jsonEncode(<String, String>{'error': 'jeton invalide'}));
        await request.response.close();
        return;
      }

      final Map<String, dynamic>? payload = await _currentState();
      request.response
        ..statusCode = payload == null ? HttpStatus.noContent : HttpStatus.ok
        ..headers.contentType = ContentType.json;
      if (payload != null) {
        request.response.write(jsonEncode(payload));
      }
      await request.response.close();
    } on Object {
      // A failed request must never take the server down with it: the commander
      // is mid-session and would have no way to know why the phone went quiet.
      try {
        request.response.statusCode = HttpStatus.internalServerError;
        await request.response.close();
      } on Object {
        // The connection is already gone; nothing left to say.
      }
    }
  }

  /// The state to publish, or null when no route is being flown.
  Future<Map<String, dynamic>?> _currentState() async {
    final Result<RouteProgress?> tracked = await _track(const NoParams());
    final RouteProgress? progress = tracked.valueOrNull;
    if (progress == null) {
      return null;
    }
    final Result<SessionPace> pace = await _measurePace(const NoParams());
    return RouteStateCodec.toJson(
      RouteStateEnvelope(
        progress: progress,
        pace: pace.valueOrNull ?? const SessionPace(),
        publishedAt: _clock.now(),
      ),
    );
  }

  /// The address a phone on the same network can actually reach.
  ///
  /// Loopback is filtered out — it is the one address that is guaranteed *not*
  /// to work from another device, and printing it would send the commander
  /// hunting through firewall settings for a problem they do not have.
  static Future<String> _bestLocalAddress() async {
    try {
      final List<NetworkInterface> interfaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4,
        includeLoopback: false,
      );
      for (final NetworkInterface interface in interfaces) {
        for (final InternetAddress address in interface.addresses) {
          if (!address.isLoopback) {
            return address.address;
          }
        }
      }
    } on Object {
      // Some sandboxes refuse to enumerate interfaces. Fall through.
    }
    return 'localhost';
  }

  static String _newToken() {
    const String alphabet = 'abcdefghjkmnpqrstuvwxyz23456789';
    final Random random = Random.secure();
    return List<String>.generate(
      8,
      (_) => alphabet[random.nextInt(alphabet.length)],
    ).join();
  }

  /// Shown to anyone who opens the address in a browser.
  static String _landingPage() => '''
<!doctype html>
<html lang="fr"><head><meta charset="utf-8">
<title>Codex Exobiologique</title>
<style>
 html,body{margin:0;height:100%;background:#06080a;color:#c3d0dd;
   font:16px/1.7 "Segoe UI",Roboto,system-ui,sans-serif;
   display:flex;align-items:center;justify-content:center;text-align:center}
 .box{border:1px solid #1e2833;background:#0a0e13;padding:40px 48px;max-width:460px;
   clip-path:polygon(0 0,calc(100% - 16px) 0,100% 16px,100% 100%,16px 100%,0 calc(100% - 16px))}
 h1{margin:0 0 14px;font-size:15px;letter-spacing:3px;text-transform:uppercase;color:#ff8c1a}
 p{margin:0;color:#9fb2c6;font-size:14px}
</style></head>
<body><div class="box"><h1>Partage de route actif</h1>
<p>Cette adresse est lue par l'application, pas par un navigateur.
Saisis le code d'appairage dans le Codex sur ton autre appareil.</p></div></body></html>
''';
}
