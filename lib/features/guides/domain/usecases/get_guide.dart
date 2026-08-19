import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/guide.dart';
import '../repositories/guide_repository.dart';

/// Loads one guide, body included, by its identifier.
@injectable
class GetGuide extends UseCase<Guide, String> {
  const GetGuide(this._repository);

  final GuideRepository _repository;

  @override
  Future<Result<Guide>> call(String input) => _repository.getGuide(input);
}
