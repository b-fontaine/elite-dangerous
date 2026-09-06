part of 'route_tracking_bloc.dart';

class RouteTrackingState extends Equatable {
  const RouteTrackingState({
    this.progress,
    this.pace = const SessionPace(),
    this.remaining,
    this.source = RouteSource.local,
    this.publishedAt,
    this.age,
    this.host,
    this.isLoading = true,
    this.isRefreshing = false,
    this.failure,
  });

  /// Null when no route is being flown, which is an ordinary state and not an
  /// error: it is what the screen shows before the first route is composed.
  final RouteProgress? progress;

  final SessionPace pace;

  /// What is left to do, at this commander's own measured pace.
  final RouteEstimate? remaining;

  /// Whether this screen is reading its own journal or a game machine.
  final RouteSource source;

  /// When the game machine computed what is on screen. Null when local.
  final DateTime? publishedAt;

  /// How stale that is, as of the last read. Null when local.
  final Duration? age;

  /// The game machine being read, for the caption. Null when local.
  final String? host;

  final bool isLoading;
  final bool isRefreshing;
  final Failure? failure;

  bool get hasRoute => progress != null;

  RoutePlan? get plan => progress?.plan;

  /// Whether this screen is a second screen rather than the game machine.
  bool get isShared => source == RouteSource.shared;

  /// The game machine did not answer at all.
  bool get isUnreachable => isShared && failure is NetworkFailure;

  /// It answered, and refused the token: the share was relaunched and this
  /// device still holds the old code.
  bool get isUnpaired => isShared && failure is UnauthorizedFailure;

  /// It answered, in a shape this version cannot read. A different problem with
  /// a different fix, and saying "injoignable" would send the commander to a
  /// firewall that is working fine.
  bool get isIncompatible =>
      isShared && failure != null && !isUnreachable && !isUnpaired;

  /// Showing figures that could not be refreshed on the last try.
  bool get isStale => hasRoute && failure != null;

  /// Composing and abandoning both write to *this* device's storage, which is
  /// not where a shared route lives. Offering them on a second screen would
  /// start a route the game machine never hears about.
  bool get canEditRoute => !isShared;

  RouteTrackingState copyWith({
    RouteProgress? progress,
    SessionPace? pace,
    RouteEstimate? remaining,
    RouteSource? source,
    DateTime? publishedAt,
    Duration? age,
    String? host,
    bool? isLoading,
    bool? isRefreshing,
    Failure? failure,
    bool clearAge = false,
    bool clearHost = false,
  }) =>
      RouteTrackingState(
        progress: progress ?? this.progress,
        pace: pace ?? this.pace,
        remaining: remaining ?? this.remaining,
        source: source ?? this.source,
        publishedAt: publishedAt ?? this.publishedAt,
        age: clearAge ? null : (age ?? this.age),
        host: clearHost ? null : (host ?? this.host),
        isLoading: isLoading ?? this.isLoading,
        isRefreshing: isRefreshing ?? this.isRefreshing,
        failure: failure,
      );

  @override
  List<Object?> get props => <Object?>[
        progress,
        pace,
        remaining,
        source,
        publishedAt,
        age,
        host,
        isLoading,
        isRefreshing,
        failure,
      ];
}
