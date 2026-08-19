import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/guide_repository.dart';

/// Points at one section of one guide.
final class GuideSectionRef extends Equatable {
  const GuideSectionRef({required this.guideId, required this.sectionId});

  final String guideId;
  final String sectionId;

  @override
  List<Object?> get props => <Object?>[guideId, sectionId];
}

/// Ticks a section off the commander's reading trail.
@injectable
class MarkGuideSectionRead extends UseCase<void, GuideSectionRef> {
  const MarkGuideSectionRead(this._repository);

  final GuideRepository _repository;

  @override
  Future<Result<void>> call(GuideSectionRef input) =>
      _repository.markSectionRead(input.guideId, input.sectionId);
}
