part of 'materials_bloc.dart';

sealed class MaterialsEvent extends Equatable {
  const MaterialsEvent();

  @override
  List<Object?> get props => const <Object?>[];
}

/// The commander dossier changed: recount everything against it.
final class MaterialsInventoryChanged extends MaterialsEvent {
  const MaterialsInventoryChanged({
    required this.inventory,
    this.suitId = 'artemis',
    this.suitGrade,
  });

  final Map<String, int> inventory;
  final String suitId;
  final int? suitGrade;

  @override
  List<Object?> get props => <Object?>[inventory, suitId, suitGrade];
}

/// The commander says a blueprint is already at [fromGrade], so the plan drops
/// everything below it.
final class MaterialsBlueprintGradeChanged extends MaterialsEvent {
  const MaterialsBlueprintGradeChanged({
    required this.blueprintId,
    required this.fromGrade,
  });

  final String blueprintId;
  final int fromGrade;

  @override
  List<Object?> get props => <Object?>[blueprintId, fromGrade];
}
