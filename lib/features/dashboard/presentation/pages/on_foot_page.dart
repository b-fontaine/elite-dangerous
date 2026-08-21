import 'package:flutter/material.dart';

import '../../../../design_system/design_system.dart';
import '../../../commander/domain/entities/commander.dart';
import '../../../commander/domain/entities/suit_info.dart';
import '../../../commander/domain/entities/suit_loadout.dart';
import '../widgets/commander_scope.dart';
import '../widgets/summary_card.dart';

/// Suits and weapons.
class OnFootPage extends StatelessWidget {
  const OnFootPage({super.key});

  @override
  Widget build(BuildContext context) => CommanderScope(
        builder: (BuildContext context, CommanderDossier dossier) =>
            _OnFootView(commander: dossier.commander),
      );
}

class _OnFootView extends StatelessWidget {
  const _OnFootView({required this.commander});

  final Commander commander;

  @override
  Widget build(BuildContext context) {
    return DetailPageScaffold(
      kicker: 'Dossier',
      title: 'Équipement à pied',
      deck: 'Combinaisons, modifications et armes.',
      slivers: <Widget>[
        DetailSection(top: EdSpacing.lg, child: _ArtemisPanel(commander: commander)),
        DetailSection(child: _SuitsPanel(commander: commander)),
        DetailSection(child: _LoadoutsPanel(commander: commander)),
      ],
    );
  }
}

/// The Artemis gets its own panel: it is the only suit that samples organics,
/// and its grade caps how many modifications can be fitted at all.
class _ArtemisPanel extends StatelessWidget {
  const _ArtemisPanel({required this.commander});

  final Commander commander;

  @override
  Widget build(BuildContext context) {
    final SuitInfo? artemis = commander.artemis;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const EdSectionHeader(title: 'Artemis Suit'),
        const SizedBox(height: EdSpacing.md),
        if (artemis == null)
          const MissingDataNote(
            what: 'Aucune Artemis',
            remedy: 'C\'est la seule combinaison dotée du Genetic Sampler : '
                'sans elle, aucun échantillon organique n\'est possible. Elle '
                's\'achète chez un Pioneer Supplies.',
            tone: EdCalloutTone.warning,
          )
        else
          EdPanel(
            accent: EdColors.green,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FactRow(
                  label: 'Grade',
                  value: '${artemis.grade}',
                  tone: EdColors.greenBright,
                ),
                FactRow(
                  label: 'Emplacements de modification',
                  value: '${artemis.modificationSlots}',
                  hint: artemis.canBeModified
                      ? null
                      : 'un grade 1 n\'en a aucun : monter en grade est le '
                          'préalable à toute modification',
                ),
                FactRow(
                  label: 'Modifications posées',
                  value: '${artemis.modIds.length}',
                ),
                if (artemis.modIds.isNotEmpty) ...<Widget>[
                  const SizedBox(height: EdSpacing.xs),
                  Wrap(
                    spacing: EdSpacing.xs,
                    runSpacing: EdSpacing.xxs,
                    children: <Widget>[
                      for (final String mod in artemis.modIds)
                        EdTag(label: mod),
                    ],
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }
}

class _SuitsPanel extends StatelessWidget {
  const _SuitsPanel({required this.commander});

  final Commander commander;

  @override
  Widget build(BuildContext context) {
    if (commander.suits.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        EdSectionHeader(title: 'Combinaisons (${commander.suits.length})'),
        const SizedBox(height: EdSpacing.md),
        EdDataTable(
          headers: const <String>['Combinaison', 'Grade', 'Rôle', 'Mods'],
          rows: <List<EdCell>>[
            for (final SuitInfo suit in commander.suits)
              <EdCell>[
                EdCell(suit.kind.label, strong: suit.isArtemis),
                EdCell.number(suit.grade == 0 ? '—' : '${suit.grade}'),
                EdCell(suit.kind.role),
                EdCell.number('${suit.modIds.length}'),
              ],
          ],
        ),
      ],
    );
  }
}

class _LoadoutsPanel extends StatelessWidget {
  const _LoadoutsPanel({required this.commander});

  final Commander commander;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const EdSectionHeader(title: 'Loadouts'),
        const SizedBox(height: EdSpacing.md),
        if (commander.suitLoadouts.isEmpty)
          const MissingDataNote(
            what: 'Aucun loadout',
            remedy: 'Ils viennent de `/profile`. Synchronise ton compte '
                'Frontier après t\'être amarré.',
          )
        else ...<Widget>[
          const MissingDataNote(
            what: 'Le grade des armes n\'est pas disponible',
            remedy: 'Frontier envoie les armes équipées et leur nom, mais ni '
                'leur grade ni leurs modifications : le champ existe et ne '
                'contient que « NYI », son propre marqueur « pas encore '
                'implémenté ». Rien, dans aucune source, ne permet de les '
                'afficher.',
          ),
          const SizedBox(height: EdSpacing.md),
          for (final SuitLoadout loadout in commander.suitLoadouts)
            Padding(
              padding: const EdgeInsets.only(bottom: EdSpacing.sm),
              child: _LoadoutCard(loadout: loadout),
            ),
        ],
      ],
    );
  }
}

class _LoadoutCard extends StatelessWidget {
  const _LoadoutCard({required this.loadout});

  final SuitLoadout loadout;

  @override
  Widget build(BuildContext context) {
    return EdPanel(
      accent: loadout.isEquipped ? EdColors.cyan : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(loadout.name, style: EdTypography.titleMedium),
              ),
              if (loadout.isEquipped)
                const EdTag(
                  label: 'ÉQUIPÉ',
                  background: EdColors.tagCyanFill,
                  foreground: EdColors.cyanBright,
                ),
            ],
          ),
          const SizedBox(height: EdSpacing.xxs),
          Text(
            '${loadout.suit.kind.label}'
            '${loadout.suit.grade == 0 ? '' : ' — grade ${loadout.suit.grade}'}',
            style: EdTypography.caption,
          ),
          const SizedBox(height: EdSpacing.xs),
          if (loadout.weapons.isEmpty)
            const Text('Aucune arme équipée.', style: EdTypography.caption)
          else
            for (final WeaponInfo weapon in loadout.orderedWeapons)
              FactRow(
                label: _slotLabel(weapon.slot),
                value: weapon.displayName,
                tone: EdColors.textBase,
              ),
        ],
      ),
    );
  }

  static String _slotLabel(String slot) => switch (slot) {
        'PrimaryWeapon1' => 'Arme principale 1',
        'PrimaryWeapon2' => 'Arme principale 2',
        'SecondaryWeapon' => 'Arme secondaire',
        _ => slot,
      };
}
