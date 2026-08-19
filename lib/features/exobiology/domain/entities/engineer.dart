import 'package:equatable/equatable.dart';

/// Which engineering track an engineer belongs to. The two are entirely
/// separate systems — a mistake that costs new commanders hours.
enum EngineerKind {
  ship('Ingénieur de vaisseau'),
  suit('Ingénieur à pied');

  const EngineerKind(this.label);

  final String label;
}

/// An engineer and what it takes to unlock them.
class Engineer extends Equatable {
  const Engineer({
    required this.id,
    required this.name,
    required this.system,
    required this.kind,
    required this.unlockRequirements,
    required this.requiresCombat,
    this.grants = const <String>[],
    this.region = 'Bulle',
    this.notes,
  });

  final String id;
  final String name;
  final String system;
  final EngineerKind kind;

  /// Human-readable unlock steps.
  final List<String> unlockRequirements;

  /// `true` when the unlock cannot be completed without ground/ship combat.
  /// The app filters on this so a pacifist commander never sees a dead end.
  final bool requiresCombat;

  /// Modification ids this engineer can install.
  final List<String> grants;

  final String region;
  final String? notes;

  @override
  List<Object?> get props => <Object?>[id, name, system, kind];
}
