import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../domain/entities/guide.dart';
import '../../domain/repositories/guide_repository.dart';
import '../datasources/guide_asset_data_source.dart';
import '../datasources/guide_read_state_local_data_source.dart';
import '../models/guide_mapper.dart';

@LazySingleton(as: GuideRepository)
class GuideRepositoryImpl implements GuideRepository {
  GuideRepositoryImpl(this._assets, this._readState);

  final GuideAssetDataSource _assets;
  final GuideReadStateLocalDataSource _readState;

  /// Guides are large and never change at runtime; parsing one on every scroll
  /// would be pure waste.
  final Map<String, Guide> _cache = <String, Guide>{};
  List<GuideSummary>? _index;

  @override
  Future<Result<List<GuideSummary>>> listGuides() async {
    final List<GuideSummary>? cached = _index;
    if (cached != null) {
      return Success<List<GuideSummary>>(cached);
    }

    final Result<String> raw = await guard(
      _assets.loadIndex,
      onError: (Object error, _) => CacheFailure(
        message: 'Index des guides introuvable.',
        cause: error,
      ),
    );

    final Result<List<String>> ids = raw.flatMap(GuideMapper.parseIndex);
    if (ids case ResultFailure<List<String>>(:final Failure failure)) {
      return ResultFailure<List<GuideSummary>>(failure);
    }

    final List<GuideSummary> summaries = <GuideSummary>[];
    for (final String id in ids.valueOrNull ?? const <String>[]) {
      final Result<Guide> guide = await getGuide(id);
      // One broken guide must not hide the rest of the library.
      if (guide.valueOrNull case final Guide value) {
        summaries.add(value.summary);
      }
    }
    _index = summaries;
    return Success<List<GuideSummary>>(summaries);
  }

  @override
  Future<Result<Guide>> getGuide(String id) async {
    final Guide? cached = _cache[id];
    if (cached != null) {
      return Success<Guide>(cached);
    }

    final Result<String> raw = await guard(
      () => _assets.loadGuide(id),
      onError: (Object error, _) => NotFoundFailure(
        message: 'Guide « $id » introuvable.',
        cause: error,
      ),
    );

    final Result<Guide> parsed = raw.flatMap(GuideMapper.parseGuide);
    if (parsed.valueOrNull case final Guide guide) {
      _cache[id] = guide;
    }
    return parsed;
  }

  @override
  Future<Result<Set<String>>> readSectionIds(String guideId) =>
      guard(() => _readState.readSections(guideId));

  @override
  Future<Result<void>> markSectionRead(String guideId, String sectionId) =>
      guard(() => _readState.markRead(guideId, sectionId));
}
