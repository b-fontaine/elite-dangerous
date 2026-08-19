import 'package:flutter/material.dart';

import '../../../../core/format/credits.dart';
import '../../../../design_system/design_system.dart';
import '../../../commander/domain/entities/commander.dart';
import '../../../commander/domain/entities/module_slot.dart';
import '../../../commander/domain/entities/ship.dart';
import '../../../commander/domain/entities/ship_module.dart';
import '../../../journal/domain/entities/journal_event.dart';
import '../../../journal/domain/entities/journal_session_state.dart';
import '../widgets/commander_scope.dart';
import '../widgets/summary_card.dart';

/// The fleet, and the fitting of the one ship Frontier details.
class FleetPage extends StatelessWidget {
  const FleetPage({super.key});

  @override
  Widget build(BuildContext context) => CommanderScope(
        builder: (BuildContext context, CommanderDossier dossier) =>
            _FleetView(dossier: dossier),
      );
}

class _FleetView extends StatelessWidget {
  const _FleetView({required this.dossier});

  final CommanderDossier dossier;

  @override
  Widget build(BuildContext context) {
    final Commander commander = dossier.commander;

    return DetailPageScaffold(
      kicker: 'Dossier',
      title: 'Flotte',
      deck: commander.fleet.isEmpty
          ? null
          : '${commander.fleet.length} vaisseaux · '
              '${formatCredits(commander.fleetValueCr)}',
      slivers: <Widget>[
        if (commander.fleet.isEmpty)
          const DetailSection(
            top: EdSpacing.lg,
            child: MissingDataNote(
              what: 'Aucun vaisseau connu',
              remedy: 'Connecte ton compte Frontier et synchronise : la flotte '
                  'vient de `/profile`. L\'événement `StoredShips` du journal '
                  'la donne aussi, sans compte.',
            ),
          )
        else ...<Widget>[
          DetailSection(
            top: EdSpacing.lg,
            child: _FleetTable(commander: commander, session: dossier.session),
          ),
          if (commander.currentShip case final Ship ship)
            DetailSection(child: _CurrentShipPanel(ship: ship, session: dossier.session)),
        ],
      ],
    );
  }
}

class _FleetTable extends StatelessWidget {
  const _FleetTable({required this.commander, required this.session});

  final Commander commander;
  final JournalSessionState session;

  @override
  Widget build(BuildContext context) {
    final List<Ship> ships = <Ship>[
      if (commander.currentShip case final Ship current) current,
      ...commander.storedShips,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const EdSectionHeader(title: 'Vaisseaux'),
        const SizedBox(height: EdSpacing.md),
        EdDataTable(
          headers: const <String>[
            'Vaisseau',
            'Type',
            'Où',
            'Valeur',
            'Rebuy',
          ],
          rows: <List<EdCell>>[
            for (final Ship ship in ships)
              <EdCell>[
                EdCell(ship.displayName, strong: ship.isCurrent),
                EdCell(ship.symbol),
                EdCell(_where(ship)),
                EdCell.number(formatCredits(ship.value.totalCr)),
                _rebuyCell(ship),
              ],
          ],
          caption: 'Le rebuy est estimé à 5 % de la coque et des modules. '
              'Frontier renvoie une coque à zéro sur les vaisseaux récents : '
              'dans ce cas le montant exact vient du journal, et seulement '
              'pour le vaisseau piloté.',
        ),
      ],
    );
  }

  String _where(Ship ship) {
    if (ship.isCurrent) {
      return 'en vol';
    }
    final List<String> parts = <String>[
      if (ship.systemName case final String system) system,
      if (ship.stationName case final String station) station,
    ];
    return parts.isEmpty ? '—' : parts.join(' · ');
  }

  /// The journal's exact figure when it applies, the 5 % estimate otherwise,
  /// and an honest dash when Frontier priced the hull at zero.
  EdCell _rebuyCell(Ship ship) {
    if (ship.isCurrent && session.rebuyCr != null) {
      return EdCell.number(formatCredits(session.rebuyCr!));
    }
    final int? estimate = ship.value.estimatedRebuyCr;
    if (estimate == null) {
      return const EdCell.mid('inconnu');
    }
    return EdCell.number('≈ ${formatCredits(estimate)}');
  }
}

class _CurrentShipPanel extends StatelessWidget {
  const _CurrentShipPanel({required this.ship, required this.session});

  final Ship ship;
  final JournalSessionState session;

  @override
  Widget build(BuildContext context) {
    final ShipLoadoutEvent? loadout = session.shipLoadout;
    final List<ShipModule> modules = ship.functionalModules;
    final List<ShipModule> engineered = ship.engineeredModules;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        EdSectionHeader(title: ship.displayName),
        const SizedBox(height: EdSpacing.md),
        EdPanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FactRow(label: 'Type', value: ship.symbol),
              if (ship.ident case final String ident)
                FactRow(label: 'Immatriculation', value: ident),
              FactRow(
                label: 'Valeur',
                value: formatCredits(ship.value.totalCr),
                hint: 'coque ${formatCredits(ship.value.hullCr)} · '
                    'modules ${formatCredits(ship.value.modulesCr)}',
              ),
              if (session.rebuyCr case final int rebuy)
                FactRow(
                  label: 'Rebuy',
                  value: formatCredits(rebuy),
                  tone: EdColors.amber,
                  hint: 'coût exact, depuis le journal',
                ),
              if (loadout?.maxJumpRangeLy case final double range)
                FactRow(
                  label: 'Portée de saut',
                  value: '${range.toStringAsFixed(2)} LY',
                  tone: EdColors.cyanBright,
                  hint: 'à pleine charge',
                ),
              if (loadout?.cargoCapacity case final int cargo)
                FactRow(label: 'Soute', value: '$cargo t'),
              if (ship.health case final ShipHealth health)
                FactRow(
                  label: 'Coque',
                  value: '${(health.hull * 100).round()} %',
                  tone: health.hull > 0.7
                      ? EdColors.greenBright
                      : EdColors.redBright,
                ),
              if (ship.launchBays.isNotEmpty)
                FactRow(
                  label: 'Véhicules',
                  value: ship.launchBays
                      .map((LaunchBayVehicle bay) => bay.displayName)
                      .join(', '),
                ),
            ],
          ),
        ),
        if (engineered.isNotEmpty) ...<Widget>[
          const SizedBox(height: EdSpacing.lg),
          const EdSubHeader('Ingénierie posée'),
          const SizedBox(height: EdSpacing.xs),
          for (final ShipModule module in engineered)
            Padding(
              padding: const EdgeInsets.only(bottom: EdSpacing.xs),
              child: _EngineeredModuleCard(module: module),
            ),
        ],
        const SizedBox(height: EdSpacing.lg),
        const EdSubHeader('Équipement'),
        const SizedBox(height: EdSpacing.xs),
        const Text(
          'Peintures, décalcomanies, plaques et COVAS sont écartés : Frontier '
          'les range parmi les modules. Un emplacement vide n\'apparaît pas '
          'dans la charge utile ; ceux repérés ci-dessous le sont par un trou '
          'dans la numérotation, ce qui ne dit rien de ceux qui suivraient le '
          'dernier emplacement occupé.',
          style: EdTypography.caption,
        ),
        for (final ModuleSlotCategory category in ModuleSlotCategory.values)
          _SlotCategoryTable(
            category: category,
            slots: ModuleSlotLayout.slotsFor(category, modules),
          ),
      ],
    );
  }
}

class _EngineeredModuleCard extends StatelessWidget {
  const _EngineeredModuleCard({required this.module});

  final ShipModule module;

  @override
  Widget build(BuildContext context) {
    final ModuleEngineering engineering = module.engineering!;

    return EdPanel(
      background: EdColors.panelRaised,
      accent: EdColors.orange,
      padding: const EdgeInsets.all(EdSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(module.displayName, style: EdTypography.bodySmall),
          const SizedBox(height: EdSpacing.xxs),
          Text(
            '${engineering.displayName} — grade ${engineering.grade} · '
            '${engineering.engineerName}',
            style: EdTypography.caption,
          ),
          if (engineering.modifiers.isNotEmpty) ...<Widget>[
            const SizedBox(height: EdSpacing.xs),
            Wrap(
              spacing: EdSpacing.xs,
              runSpacing: EdSpacing.xxs,
              children: <Widget>[
                for (final ModuleModifier modifier in engineering.modifiers)
                  EdTag(
                    label: '${modifier.label} ${modifier.displayValue}',
                    background: modifier.isImprovement ?? false
                        ? EdColors.tagGreenFill
                        : EdColors.panelHeader,
                    foreground: modifier.isImprovement ?? false
                        ? EdColors.greenBright
                        : EdColors.textMuted,
                  ),
              ],
            ),
          ],
          if (engineering.experimentalEffects.isNotEmpty) ...<Widget>[
            const SizedBox(height: EdSpacing.xxs),
            Text(
              'Effet expérimental : '
              '${engineering.experimentalEffects.join(', ')}',
              style: EdTypography.caption,
            ),
          ],
        ],
      ),
    );
  }
}

/// One outfitting category, filled and empty slots together.
class _SlotCategoryTable extends StatelessWidget {
  const _SlotCategoryTable({required this.category, required this.slots});

  final ModuleSlotCategory category;
  final List<ModuleSlot> slots;

  @override
  Widget build(BuildContext context) {
    if (slots.isEmpty) {
      return const SizedBox.shrink();
    }
    final int empty = slots.where((ModuleSlot slot) => slot.isEmpty).length;

    return Padding(
      padding: const EdgeInsets.only(top: EdSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            '${category.label} — ${slots.length - empty} occupé(s)'
            '${empty == 0 ? '' : ', $empty vide(s)'}',
            style: EdTypography.bodySmall,
          ),
          const SizedBox(height: EdSpacing.xxs),
          EdDataTable(
            headers: const <String>['Emplacement', 'Module', 'État'],
            rows: <List<EdCell>>[
              for (final ModuleSlot slot in slots)
                <EdCell>[
                  EdCell(_slotLabel(slot)),
                  if (slot.module case final ShipModule module)
                    EdCell(module.displayName, strong: module.isEngineered)
                  else
                    const EdCell.mid('vide'),
                  _stateCell(slot),
                ],
            ],
          ),
        ],
      ),
    );
  }

  /// An empty slot has no declared size, only a bound: saying "taille 6" where
  /// the payload allows 5 or 6 would be a guess dressed as a fact.
  static String _slotLabel(ModuleSlot slot) {
    if (!slot.isEmpty || slot.size == null) {
      return slot.name;
    }
    return slot.sizeIsBounded
        ? '${slot.name} (taille ≤ ${slot.size})'
        : '${slot.name} (taille ${slot.size})';
  }

  static EdCell _stateCell(ModuleSlot slot) {
    final ShipModule? module = slot.module;
    if (module == null) {
      return const EdCell('—');
    }
    if (module.isEngineered) {
      return EdCell.win('ingénieré G${module.engineering!.grade}');
    }
    return module.isPowered ? const EdCell('alimenté') : const EdCell.lose('éteint');
  }
}
