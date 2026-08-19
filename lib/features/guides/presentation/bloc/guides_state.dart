part of 'guides_bloc.dart';

sealed class GuidesState extends Equatable {
  const GuidesState();

  @override
  List<Object?> get props => const <Object?>[];
}

final class GuidesInitial extends GuidesState {
  const GuidesInitial();
}

final class GuidesLoading extends GuidesState {
  const GuidesLoading();
}

final class GuidesReady extends GuidesState {
  const GuidesReady({required this.guides, this.query = ''});

  final List<GuideSummary> guides;
  final String query;

  bool get isFiltered => query.trim().isNotEmpty;

  @override
  List<Object?> get props => <Object?>[guides, query];
}

final class GuidesError extends GuidesState {
  const GuidesError(this.failure);

  final Failure failure;

  @override
  List<Object?> get props => <Object?>[failure];
}
