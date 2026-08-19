import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/guide.dart';
import '../repositories/guide_repository.dart';

/// Lists the bundled guides, in authoring order.
@injectable
class ListGuides extends UseCase<List<GuideSummary>, NoParams> {
  const ListGuides(this._repository);

  final GuideRepository _repository;

  @override
  Future<Result<List<GuideSummary>>> call(NoParams input) =>
      _repository.listGuides();
}
