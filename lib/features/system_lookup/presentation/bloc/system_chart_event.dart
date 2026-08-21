part of 'system_chart_bloc.dart';

sealed class SystemChartEvent extends Equatable {
  const SystemChartEvent();

  @override
  List<Object?> get props => const <Object?>[];
}

/// The commander is somewhere else now.
///
/// Carries the `id64` and not the name, because the name is not a key: two
/// systems can be called the same thing and only the address is unique.
final class SystemChartTargetChanged extends SystemChartEvent {
  const SystemChartTargetChanged({this.id64, this.systemName});

  final int? id64;
  final String? systemName;

  @override
  List<Object?> get props => <Object?>[id64, systemName];
}

/// The commander asked. This is the only event that can send a request.
final class SystemChartRequested extends SystemChartEvent {
  const SystemChartRequested({this.refresh = false});

  /// Ignore a cached answer and ask again.
  final bool refresh;

  @override
  List<Object?> get props => <Object?>[refresh];
}

/// The commander wants the species of one body, by name and coordinates.
final class SystemChartBodyRequested extends SystemChartEvent {
  const SystemChartBodyRequested(this.body, {this.refresh = false});

  final ChartedBody body;
  final bool refresh;

  @override
  List<Object?> get props => <Object?>[body, refresh];
}
