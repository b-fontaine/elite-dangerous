import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../commander/domain/entities/suit_info.dart';
import '../../../dashboard/presentation/widgets/commander_scope.dart';
import '../../../journal/domain/entities/journal_session_state.dart';
import '../bloc/materials_bloc.dart';

/// Provides a [MaterialsBloc] fed by the commander dossier.
///
/// The inventory is pushed into the bloc rather than watched by it: it belongs
/// to the dossier the cockpit already loads, and a second subscription would
/// let two screens disagree about the same counts.
class MaterialsScope extends StatelessWidget {
  const MaterialsScope({required this.builder, super.key});

  final Widget Function(BuildContext context, CommanderDossier dossier) builder;

  @override
  Widget build(BuildContext context) => CommanderScope(
        builder: (BuildContext context, CommanderDossier dossier) =>
            BlocProvider<MaterialsBloc>(
          create: (_) => getIt<MaterialsBloc>(),
          child: _InventoryFeeder(
            dossier: dossier,
            child: Builder(
              builder: (BuildContext inner) => builder(inner, dossier),
            ),
          ),
        ),
      );
}

/// Sends the dossier's inventory to the bloc, and again whenever it moves.
class _InventoryFeeder extends StatefulWidget {
  const _InventoryFeeder({required this.dossier, required this.child});

  final CommanderDossier dossier;
  final Widget child;

  @override
  State<_InventoryFeeder> createState() => _InventoryFeederState();
}

class _InventoryFeederState extends State<_InventoryFeeder> {
  @override
  void initState() {
    super.initState();
    _push();
  }

  @override
  void didUpdateWidget(_InventoryFeeder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.dossier.session != widget.dossier.session ||
        oldWidget.dossier.commander.artemis !=
            widget.dossier.commander.artemis) {
      _push();
    }
  }

  void _push() {
    final JournalSessionState session = widget.dossier.session;
    final SuitInfo? artemis = widget.dossier.commander.artemis;
    context.read<MaterialsBloc>().add(
          MaterialsInventoryChanged(
            // One store as far as a plan is concerned: a recipe asks for
            // Graphene and Datamined Wake Exceptions without caring that one
            // is in the backpack and the other in the ship.
            inventory: <String, int>{
              ...session.onFootInventory,
              ...session.shipMaterials,
            },
            suitGrade: artemis?.grade,
          ),
        );
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
