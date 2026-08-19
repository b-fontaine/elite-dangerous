part of 'guide_detail_bloc.dart';

sealed class GuideDetailState extends Equatable {
  const GuideDetailState();

  @override
  List<Object?> get props => const <Object?>[];
}

final class GuideDetailInitial extends GuideDetailState {
  const GuideDetailInitial();
}

final class GuideDetailLoading extends GuideDetailState {
  const GuideDetailLoading();
}

final class GuideDetailReady extends GuideDetailState {
  const GuideDetailReady({
    required this.guide,
    this.readSectionIds = const <String>{},
  });

  final Guide guide;
  final Set<String> readSectionIds;

  double get readRatio => guide.sections.isEmpty
      ? 0
      : readSectionIds.length / guide.sections.length;

  GuideDetailReady copyWith({Set<String>? readSectionIds}) =>
      GuideDetailReady(
        guide: guide,
        readSectionIds: readSectionIds ?? this.readSectionIds,
      );

  @override
  List<Object?> get props => <Object?>[guide, readSectionIds];
}

final class GuideDetailError extends GuideDetailState {
  const GuideDetailError(this.failure);

  final Failure failure;

  @override
  List<Object?> get props => <Object?>[failure];
}
