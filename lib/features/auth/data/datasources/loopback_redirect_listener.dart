import 'dart:async';
import 'dart:io';

import 'oauth_redirect_listener.dart';

/// Desktop strategy: bind an HTTP server on an ephemeral loopback port and let
/// Frontier redirect the browser to it.
///
/// This is what EDMC does on Linux (`HTTPServer(("localhost", 0))`). Frontier
/// does not whitelist redirect URIs: verified end to end against a registered
/// client whose Developer Zone endpoint list is empty, which the ephemeral port
/// drawn here would otherwise never match. That absence of any server-side
/// check is precisely why the `state` check downstream is mandatory.
class LoopbackRedirectListener implements OAuthRedirectListener {
  LoopbackRedirectListener({this.path = '/auth'});

  final String path;

  HttpServer? _server;
  final Completer<OAuthRedirectResult> _completer =
      Completer<OAuthRedirectResult>();

  @override
  Future<String> start() async {
    final HttpServer server =
        await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    _server = server;

    unawaited(
      server.forEach((HttpRequest request) async {
        if (request.uri.path != path) {
          request.response.statusCode = HttpStatus.notFound;
          await request.response.close();
          return;
        }
        final OAuthRedirectResult result =
            OAuthRedirectResult.fromUri(request.uri);
        request.response
          ..statusCode = HttpStatus.ok
          ..headers.contentType = ContentType.html
          ..write(_landingPage(result.isSuccess));
        await request.response.close();
        if (!_completer.isCompleted) {
          _completer.complete(result);
        }
      }).catchError((Object _) {}),
    );

    return 'http://localhost:${server.port}$path';
  }

  @override
  Future<OAuthRedirectResult> awaitRedirect({required Duration timeout}) =>
      _completer.future.timeout(timeout);

  @override
  Future<void> dispose() async {
    await _server?.close(force: true);
    _server = null;
  }

  /// Shown in the browser tab once Frontier has redirected. Kept inline and
  /// self-contained: there is no asset server behind this.
  static String _landingPage(bool success) {
    final String title = success ? 'Connexion réussie' : 'Connexion refusée';
    final String message = success
        ? 'Tu peux fermer cet onglet et revenir à l\'application.'
        : 'Frontier a refusé l\'autorisation. Reviens à l\'application et réessaie.';
    final String accent = success ? '#ff8c1a' : '#ff5f64';
    return '''
<!doctype html>
<html lang="fr"><head><meta charset="utf-8">
<title>$title</title>
<style>
 html,body{margin:0;height:100%;background:#06080a;color:#c3d0dd;
   font:16px/1.7 "Segoe UI",Roboto,system-ui,sans-serif;
   display:flex;align-items:center;justify-content:center;text-align:center}
 .box{border:1px solid #1e2833;background:#0a0e13;padding:40px 48px;max-width:460px;
   clip-path:polygon(0 0,calc(100% - 16px) 0,100% 16px,100% 100%,16px 100%,0 calc(100% - 16px))}
 h1{margin:0 0 14px;font-size:15px;letter-spacing:3px;text-transform:uppercase;color:$accent}
 p{margin:0;color:#9fb2c6;font-size:14px}
</style></head>
<body><div class="box"><h1>$title</h1><p>$message</p></div></body></html>
''';
  }
}
