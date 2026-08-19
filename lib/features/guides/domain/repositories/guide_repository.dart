import '../../../../core/result/result.dart';
import '../entities/guide.dart';

/// Access to the bundled guide library and to the commander's reading trail.
///
/// There is no backend: guides ship as JSON assets and the read state lives in
/// the local key/value store.
abstract interface class GuideRepository {
  /// The library index, in authoring order.
  Future<Result<List<GuideSummary>>> listGuides();

  /// One fully parsed guide.
  Future<Result<Guide>> getGuide(String id);

  /// Identifiers of the sections the commander already read in [guideId].
  Future<Result<Set<String>>> readSectionIds(String guideId);

  /// Records that [sectionId] of [guideId] has been read.
  Future<Result<void>> markSectionRead(String guideId, String sectionId);
}
