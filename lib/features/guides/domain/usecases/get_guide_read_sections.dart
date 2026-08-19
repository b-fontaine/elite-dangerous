import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/guide_repository.dart';

/// Reads back which sections of a guide the commander already went through.
@injectable
class GetGuideReadSections extends UseCase<Set<String>, String> {
  const GetGuideReadSections(this._repository);

  final GuideRepository _repository;

  @override
  Future<Result<Set<String>>> call(String input) =>
      _repository.readSectionIds(input);
}
