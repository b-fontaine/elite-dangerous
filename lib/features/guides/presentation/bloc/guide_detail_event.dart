part of 'guide_detail_bloc.dart';

sealed class GuideDetailEvent extends Equatable {
  const GuideDetailEvent();

  @override
  List<Object?> get props => const <Object?>[];
}

final class GuideDetailRequested extends GuideDetailEvent {
  const GuideDetailRequested(this.guideId);

  final String guideId;

  @override
  List<Object?> get props => <Object?>[guideId];
}

/// Emitted when a section scrolls into view, so the library can show progress.
final class GuideSectionMarkedRead extends GuideDetailEvent {
  const GuideSectionMarkedRead(this.sectionId);

  final String sectionId;

  @override
  List<Object?> get props => <Object?>[sectionId];
}
