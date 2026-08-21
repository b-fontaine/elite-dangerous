part of 'system_chart_bloc.dart';

class SystemChartState extends Equatable {
  const SystemChartState({
    required this.isSupported,
    this.id64,
    this.systemName,
    this.system,
    this.landmarks = const <int, BodyLandmarks>{},
    this.pendingBodies = const <int>{},
    this.isLoading = false,
    this.failure,
  });

  /// False on the web, where the browser blocks the request outright.
  final bool isSupported;

  /// The system the commander is in, as the journal reports it.
  final int? id64;
  final String? systemName;

  /// What Spansh says about it, from cache or from the network.
  final ChartedSystem? system;

  /// Species by body `id64`, for the bodies that were asked about.
  final Map<int, BodyLandmarks> landmarks;

  /// Bodies with a request in flight.
  final Set<int> pendingBodies;

  final bool isLoading;
  final Failure? failure;

  /// Whether asking is possible at all: supported build, known address.
  bool get canAsk => isSupported && id64 != null;

  bool get hasAnswer => system != null;

  /// Whether what is on screen came from the cache rather than the network.
  bool get isFromCache => system?.fromCache ?? false;

  BodyLandmarks? landmarksFor(ChartedBody body) => landmarks[body.id64];

  bool isPending(ChartedBody body) => pendingBodies.contains(body.id64);

  SystemChartState copyWith({
    bool? isSupported,
    int? id64,
    String? systemName,
    ChartedSystem? system,
    Map<int, BodyLandmarks>? landmarks,
    Set<int>? pendingBodies,
    bool? isLoading,
    Failure? failure,
    bool clearFailure = false,
  }) {
    return SystemChartState(
      isSupported: isSupported ?? this.isSupported,
      id64: id64 ?? this.id64,
      systemName: systemName ?? this.systemName,
      system: system ?? this.system,
      landmarks: landmarks ?? this.landmarks,
      pendingBodies: pendingBodies ?? this.pendingBodies,
      isLoading: isLoading ?? this.isLoading,
      failure: clearFailure ? null : (failure ?? this.failure),
    );
  }

  @override
  List<Object?> get props => <Object?>[
        isSupported,
        id64,
        systemName,
        system,
        landmarks,
        pendingBodies,
        isLoading,
        failure,
      ];
}
