import 'package:flutter/material.dart';

import '../../../../design_system/design_system.dart';
import '../../../commander/domain/entities/station_services.dart';
import '../../../journal/domain/entities/journal_event.dart';
import '../widgets/commander_scope.dart';
import '../widgets/summary_card.dart';

/// The last station docked at: what it is, and what it lets you do.
class StationPage extends StatelessWidget {
  const StationPage({super.key});

  @override
  Widget build(BuildContext context) => CommanderScope(
        builder: (BuildContext context, CommanderDossier dossier) =>
            _StationView(dossier: dossier),
      );
}

class _StationView extends StatelessWidget {
  const _StationView({required this.dossier});

  final CommanderDossier dossier;

  @override
  Widget build(BuildContext context) {
    final StationServices station = dossier.commander.station;
    final DockedEvent? docked = dossier.session.dockedAt;
    final String? name = station.stationName ?? docked?.stationName;

    return DetailPageScaffold(
      kicker: 'Dossier',
      title: name ?? 'Station',
      deck: name == null
          ? null
          : <String>[
              if (docked?.stationType case final String type) type,
              if (station.systemName ?? docked?.starSystem case final String s)
                s,
            ].join(' · '),
      slivers: <Widget>[
        if (name == null)
          const DetailSection(
            top: EdSpacing.lg,
            child: MissingDataNote(
              what: 'Aucune station',
              remedy: 'Amarre-toi puis synchronise : `/profile` renvoie la '
                  'dernière station et ses services. L\'événement `Docked` du '
                  'journal en dit plus encore — type, distance à l\'étoile, '
                  'économies, plateformes.',
            ),
          )
        else ...<Widget>[
          DetailSection(
            top: EdSpacing.lg,
            child: _IdentityPanel(station: station, docked: docked),
          ),
          DetailSection(child: _ServicesPanel(station: station)),
        ],
      ],
    );
  }
}

class _IdentityPanel extends StatelessWidget {
  const _IdentityPanel({required this.station, this.docked});

  final StationServices station;
  final DockedEvent? docked;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const EdSectionHeader(title: 'Identité'),
        const SizedBox(height: EdSpacing.md),
        EdPanel(
          accent: station.sellsOrganicData ? EdColors.green : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (station.sellsOrganicData) ...<Widget>[
                const Text(
                  'Vista Genomics est présent : les données organiques se '
                  'vendent ici.',
                  style: EdTypography.bodySmall,
                ),
                const SizedBox(height: EdSpacing.sm),
              ],
              if (docked?.stationType case final String type)
                FactRow(label: 'Type', value: type),
              if (station.systemName ?? docked?.starSystem case final String s)
                FactRow(label: 'Système', value: s),
              if (docked?.distanceFromStarLs case final double distance)
                FactRow(
                  label: 'Distance à l\'étoile',
                  value: '${distance.round()} ls',
                ),
              if (docked?.faction ?? station.minorFaction case final String f)
                FactRow(label: 'Faction', value: f),
              if (docked?.allegiance case final String allegiance)
                FactRow(label: 'Allégeance', value: allegiance),
              if (docked?.government case final String government)
                FactRow(label: 'Gouvernement', value: government),
              if (docked?.economy case final String economy)
                FactRow(
                  label: 'Économie',
                  value: economy,
                  hint: docked?.secondEconomy,
                ),
              if (docked case final DockedEvent event)
                if (event.largePads + event.mediumPads + event.smallPads > 0)
                  FactRow(
                    label: 'Plateformes',
                    value: '${event.largePads} L · ${event.mediumPads} M · '
                        '${event.smallPads} S',
                  ),
            ],
          ),
        ),
        if (docked == null) ...<Widget>[
          const SizedBox(height: EdSpacing.md),
          const Text(
            'Type, distance, économies et plateformes viennent de l\'événement '
            '`Docked` du journal : la Companion API ne les donne pas.',
            style: EdTypography.caption,
          ),
        ],
      ],
    );
  }
}

class _ServicesPanel extends StatelessWidget {
  const _ServicesPanel({required this.station});

  final StationServices station;

  @override
  Widget build(BuildContext context) {
    final List<StationServiceGroup> groups = station.grouped;
    final Set<String> ungrouped = station.ungrouped;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        EdSectionHeader(title: 'Services (${station.services.length})'),
        const SizedBox(height: EdSpacing.md),
        if (groups.isEmpty)
          const Text(
            'Aucun service disponible — la station est peut-être hors service.',
            style: EdTypography.bodySmall,
          )
        else
          for (final StationServiceGroup group in groups)
            Padding(
              padding: const EdgeInsets.only(bottom: EdSpacing.md),
              child: _GroupPanel(group: group),
            ),
        if (ungrouped.isNotEmpty) ...<Widget>[
          const EdSubHeader('Non classés'),
          const SizedBox(height: EdSpacing.xs),
          // Frontier adds services without warning; showing them unfiled beats
          // dropping them silently.
          Wrap(
            spacing: EdSpacing.xs,
            runSpacing: EdSpacing.xxs,
            children: <Widget>[
              for (final String key in ungrouped) EdTag(label: key),
            ],
          ),
        ],
      ],
    );
  }
}

class _GroupPanel extends StatelessWidget {
  const _GroupPanel({required this.group});

  final StationServiceGroup group;

  @override
  Widget build(BuildContext context) {
    return EdPanel(
      background: EdColors.panelRaised,
      padding: const EdgeInsets.all(EdSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(group.label, style: EdTypography.bodySmall),
          const SizedBox(height: EdSpacing.xs),
          Wrap(
            spacing: EdSpacing.xs,
            runSpacing: EdSpacing.xxs,
            children: <Widget>[
              for (final String key in group.keys)
                EdTag(
                  label: StationServiceGroup.labelFor(key),
                  background: key == 'vistagenomics'
                      ? EdColors.tagGreenFill
                      : EdColors.panelHeader,
                  foreground: key == 'vistagenomics'
                      ? EdColors.greenBright
                      : EdColors.textMuted,
                ),
            ],
          ),
          if (group.note case final String note) ...<Widget>[
            const SizedBox(height: EdSpacing.xs),
            Text(note, style: EdTypography.caption),
          ],
        ],
      ),
    );
  }
}
