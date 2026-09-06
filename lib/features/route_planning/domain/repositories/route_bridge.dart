import '../../../../core/result/result.dart';
import '../entities/route_state_envelope.dart';

/// How to reach a host that is publishing its route.
class BridgePairing {
  const BridgePairing({
    required this.host,
    required this.port,
    required this.token,
  });

  final String host;
  final int port;

  /// A one-off secret the host prints and the client is given.
  ///
  /// EDDiscovery's web server — the precedent for this whole lot — documents no
  /// authentication at all: anyone on the network who knows the port sees the
  /// state. A short token costs nothing and closes that.
  final String token;

  Uri get stateUri =>
      Uri.parse('http://$host:$port/state').replace(
        queryParameters: <String, String>{'token': token},
      );

  /// What the host shows on screen for the commander to type on the phone.
  String get code => '$host:$port/$token';

  /// Reads back what [code] produced. Null when it is not one.
  static BridgePairing? parse(String raw) {
    final String trimmed = raw.trim();
    final int slash = trimmed.lastIndexOf('/');
    if (slash <= 0) {
      return null;
    }
    final String token = trimmed.substring(slash + 1);
    final String address = trimmed.substring(0, slash);
    final int colon = address.lastIndexOf(':');
    if (colon <= 0 || token.isEmpty) {
      return null;
    }
    final int? port = int.tryParse(address.substring(colon + 1));
    if (port == null) {
      return null;
    }
    return BridgePairing(
      host: address.substring(0, colon),
      port: port,
      token: token,
    );
  }
}

/// The game machine, publishing what it knows.
///
/// A server on the commander's own machine, on their own network. Nothing is
/// hosted, no account is involved, and it only runs while it is switched on —
/// which is the whole difference between this and a cloud relay, and the reason
/// the README's "no server component" line needed rewording rather than
/// defending.
abstract interface class RouteBridgeHost {
  /// Whether this build can open a socket at all. False on the web.
  bool get isSupported;

  bool get isRunning;

  /// The pairing in force, or null when the host is stopped.
  BridgePairing? get pairing;

  /// Binds a port and starts serving. Returns what to type on the other device.
  Future<Result<BridgePairing>> start({int port = defaultPort});

  Future<void> stop();

  /// Port used unless the commander picks another. Above 1024 so no privilege
  /// is needed, and unlikely to collide with anything a gaming machine runs.
  static const int defaultPort = 8420;
}

/// A second screen, reading the game machine.
abstract interface class RouteBridgeClient {
  /// The pairing this device is bound to, if any.
  Future<BridgePairing?> pairing();

  Future<void> pair(BridgePairing pairing);

  Future<void> unpair();

  /// Fetches the host's current state.
  ///
  /// Returns the envelope as JSON rather than a decoded entity so the decoding
  /// failure and the network failure stay distinguishable: one means the host
  /// is running a different version, the other that it is off.
  Future<Result<Map<String, dynamic>>> fetchState();

  /// The route the paired machine is flying, decoded.
  ///
  /// Three answers, and the screen says something different for each: a route,
  /// `null` when the host is reachable and flying none, and a failure when it
  /// cannot be reached at all. Collapsing the last two would show an empty
  /// route for a sleeping PC — the one lie this whole bridge is built to avoid.
  Future<Result<RouteStateEnvelope?>> readRoute();
}
