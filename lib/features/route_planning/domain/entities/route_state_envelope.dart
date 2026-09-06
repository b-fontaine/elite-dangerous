import 'route_progress.dart';
import 'session_pace.dart';

/// What one device publishes about the route being flown, and another reads.
///
/// **The computed state travels, not the raw material.** The phone has no
/// journal and no game files; sending it events to fold would mean shipping the
/// whole domain and megabytes of journal across the network so both ends could
/// arrive at the same answer. One end computes, the other displays.
///
/// The timestamp is not decoration. Nothing on the wire says whether the game
/// is still running — the game only rewrites its files when something changes,
/// so twenty quiet minutes at a station are normal. The client shows the *age*
/// of what it holds rather than a "connected" light that would lie.
///
/// An entity rather than a data model: both ends of the bridge are this
/// application, and what crosses the wire is the same thing the follow screen
/// renders. The JSON shape it travels in lives in the data layer, where the
/// codec is.
class RouteStateEnvelope {
  const RouteStateEnvelope({
    required this.progress,
    required this.pace,
    required this.publishedAt,
  });

  final RouteProgress progress;
  final SessionPace pace;

  /// When the host computed this, in UTC. The client reports its age.
  final DateTime publishedAt;
}
