import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/guide.dart';
import '../repositories/guide_repository.dart';

/// Full-text search over the library: title, topics and the prose of every
/// block of every section.
///
/// A blank query short-circuits to the untouched library, so the caller can
/// bind this straight to a search field without special-casing the empty state.
@injectable
class SearchGuides extends UseCase<List<GuideSummary>, String> {
  const SearchGuides(this._repository);

  final GuideRepository _repository;

  @override
  Future<Result<List<GuideSummary>>> call(String input) async {
    final Result<List<GuideSummary>> listed = await _repository.listGuides();
    if (listed case ResultFailure<List<GuideSummary>>()) {
      return listed;
    }
    final List<GuideSummary> summaries =
        listed.valueOrNull ?? const <GuideSummary>[];
    if (foldForSearch(input).isEmpty) {
      return Success<List<GuideSummary>>(summaries);
    }

    final List<GuideSummary> matches = <GuideSummary>[];
    for (final GuideSummary summary in summaries) {
      final Result<Guide> loaded = await _repository.getGuide(summary.id);
      switch (loaded) {
        case ResultFailure<Guide>(:final failure):
          return ResultFailure<List<GuideSummary>>(failure);
        case Success<Guide>(:final Guide value):
          if (value.matches(input)) {
            matches.add(summary);
          }
      }
    }
    return Success<List<GuideSummary>>(List<GuideSummary>.unmodifiable(matches));
  }
}
