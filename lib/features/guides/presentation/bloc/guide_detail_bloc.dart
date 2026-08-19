import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../domain/entities/guide.dart';
import '../../domain/usecases/get_guide.dart';
import '../../domain/usecases/get_guide_read_sections.dart';
import '../../domain/usecases/mark_guide_section_read.dart';

part 'guide_detail_event.dart';
part 'guide_detail_state.dart';

@injectable
class GuideDetailBloc extends Bloc<GuideDetailEvent, GuideDetailState> {
  GuideDetailBloc(this._getGuide, this._readSections, this._markRead)
      : super(const GuideDetailInitial()) {
    on<GuideDetailRequested>(_onRequested);
    on<GuideSectionMarkedRead>(_onSectionRead);
  }

  final GetGuide _getGuide;
  final GetGuideReadSections _readSections;
  final MarkGuideSectionRead _markRead;

  Future<void> _onRequested(
    GuideDetailRequested event,
    Emitter<GuideDetailState> emit,
  ) async {
    emit(const GuideDetailLoading());
    final Result<Guide> guide = await _getGuide(event.guideId);
    final Result<Set<String>> read = await _readSections(event.guideId);
    emit(
      guide.fold(
        onSuccess: (Guide value) => GuideDetailReady(
          guide: value,
          readSectionIds: read.valueOrNull ?? const <String>{},
        ),
        onFailure: GuideDetailError.new,
      ),
    );
  }

  Future<void> _onSectionRead(
    GuideSectionMarkedRead event,
    Emitter<GuideDetailState> emit,
  ) async {
    final GuideDetailState current = state;
    if (current is! GuideDetailReady) {
      return;
    }
    if (current.readSectionIds.contains(event.sectionId)) {
      return;
    }
    await _markRead(
      GuideSectionRef(
        guideId: current.guide.id,
        sectionId: event.sectionId,
      ),
    );
    emit(
      current.copyWith(
        readSectionIds: <String>{...current.readSectionIds, event.sectionId},
      ),
    );
  }
}
