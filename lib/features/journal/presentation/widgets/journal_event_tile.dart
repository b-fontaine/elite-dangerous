import 'package:flutter/material.dart';

import '../../../../design_system/design_system.dart';
import '../../../exobiology/presentation/widgets/credits_format.dart';
import '../../domain/entities/journal_event.dart';

/// One line of the flight log.
class JournalEventTile extends StatelessWidget {
  const JournalEventTile({required this.event, super.key});

  final JournalEvent event;

  @override
  Widget build(BuildContext context) {
    final (IconData icon, Color accent, String title, String? detail) =
        _describe(event);

    return EdPanel(
      notch: EdNotch.tile,
      padding: const EdgeInsets.symmetric(
        horizontal: EdSpacing.md,
        vertical: EdSpacing.xs,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, size: 16, color: accent),
          const SizedBox(width: EdSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(title, style: EdTypography.bodySmall),
                if (detail != null)
                  Text(detail, style: EdTypography.caption),
              ],
            ),
          ),
          const SizedBox(width: EdSpacing.xs),
          Text(_time(event.timestamp), style: EdTypography.caption),
        ],
      ),
    );
  }

  static (IconData, Color, String, String?) _describe(JournalEvent event) {
    return switch (event) {
      final ScanOrganicEvent e => (
          Icons.biotech_outlined,
          e.completesOrganism ? EdColors.greenBright : EdColors.cyan,
          e.displayName,
          '${e.scanType.label}'
              '${e.variantLocalised == null ? '' : ' · ${e.variantLocalised}'}',
        ),
      final SellOrganicDataEvent e => (
          Icons.savings_outlined,
          EdColors.gold,
          'Vente à Vista Genomics — ${formatCredits(e.totalCr)}',
          '${e.entries.length} organisme(s)'
              '${e.firstLoggedCount > 0 ? ' · ${e.firstLoggedCount} First Logged ×5' : ''}',
        ),
      final BodySignalsEvent e => (
          Icons.sensors,
          e.biologicalCount > 0 ? EdColors.orangeBright : EdColors.textFainter,
          e.bodyName ?? 'Corps inconnu',
          <String>[
            '${e.biologicalCount} signal(aux) biologique(s)',
            e.fromDetailedScan ? 'DSS' : 'FSS',
            // Le FSS donne un nombre, le DSS donne les genres : les montrer
            // est toute la différence entre « il y a de la vie ici » et
            // « il y a du Stratum ici ».
            if (e.identifiesGenuses)
              e.genuses.map((DetectedGenus g) => g.displayName).join(', '),
          ].join(' · '),
        ),
      final BodyScanEvent e => (
          Icons.public,
          e.wasDiscovered ? EdColors.textMuted : EdColors.gold,
          e.bodyName,
          <String>[
            if (e.planetClass != null) e.planetClass!,
            if (e.surfaceGravityG != null)
              '${e.surfaceGravityG!.toStringAsFixed(2)} g',
            if (e.surfaceTemperatureK != null)
              '${e.surfaceTemperatureK!.toStringAsFixed(0)} K',
            // La prime que le commandant risque de laisser sur la table s'il
            // vend sans avoir remarqué qu'il est le premier à passer.
            if (!e.wasDiscovered) 'première découverte',
            if (!e.wasMapped) 'jamais cartographié',
          ].join(' · '),
        ),
      final DiscoveryScanEvent e => (
          Icons.wifi_tethering,
          EdColors.cyan,
          'Balayage de découverte — ${e.bodyCount} corps',
          e.systemName,
        ),
      final AllBodiesFoundEvent e => (
          Icons.done_all,
          EdColors.greenBright,
          'Système entièrement exploré',
          '${e.count} corps · ${e.systemName ?? ''}'.trim(),
        ),
      final SurfaceMappedEvent e => (
          Icons.satellite_alt_outlined,
          EdColors.orangeBright,
          'Cartographié — ${e.bodyName}',
          <String>[
            '${e.probesUsed} sonde(s)',
            if (e.wasEfficient) 'sous la cible d\'efficacité',
          ].join(' · '),
        ),
      final SurfaceContactEvent e => (
          e.isTouchdown ? Icons.flight_land : Icons.flight_takeoff,
          EdColors.cyanBright,
          e.isTouchdown ? 'Atterrissage' : 'Décollage',
          <String>[
            if (e.bodyName case final String body) body,
            // Worth saying out loud: the line looks identical to a landing the
            // commander flew, and means the opposite.
            if (!e.carriesCommander) 'vaisseau seul',
          ].join(' · '),
        ),
      final EmbarkEvent e => (
          e.isDisembark
              ? Icons.directions_walk
              : Icons.airline_seat_recline_normal,
          EdColors.cyanBright,
          e.isDisembark ? 'Sortie à pied' : 'Embarquement',
          e.stationName ?? e.bodyName,
        ),
      final RankEvent e => (
          Icons.military_tech_outlined,
          EdColors.purpleBright,
          e.isProgress ? 'Progression de rang' : 'Rangs',
          e.values.entries
              .map((MapEntry<String, int> entry) =>
                  '${entry.key} ${entry.value}')
              .join(' · '),
        ),
      final LoadGameEvent e => (
          Icons.play_circle_outline,
          EdColors.textMuted,
          'Session — ${e.commander}',
          '${formatCredits(e.creditsCr)}'
              '${e.shipName == null ? '' : ' · ${e.shipName}'}',
        ),
      final SuitEvent e => (
          Icons.checkroom_outlined,
          EdColors.greenBright,
          e.suitName ?? e.suitSymbol,
          e.grade == null ? null : 'Grade ${e.grade}',
        ),
      final StatisticsEvent e => (
          Icons.query_stats,
          EdColors.gold,
          'Statistiques de carrière',
          e.organicDataProfitCr == null
              ? '${e.sections.length} section(s)'
              : 'Exobiologie : '
                  '${formatCredits(e.organicDataProfitCr!)} de profit',
        ),
      final ReputationEvent e => (
          Icons.handshake_outlined,
          EdColors.purpleBright,
          'Réputations',
          e.values.entries
              .map(
                (MapEntry<String, double> entry) =>
                    '${entry.key} ${entry.value.toStringAsFixed(0)}',
              )
              .join(' · '),
        ),
      final EngineerProgressEvent e => (
          Icons.build_outlined,
          EdColors.orangeBright,
          e.isFullRoster ? 'Ingénieurs' : 'Progression d\'ingénieur',
          '${e.unlocked.length} débloqué(s) sur ${e.engineers.length}',
        ),
      final ShipLoadoutEvent e => (
          Icons.rocket_launch_outlined,
          EdColors.cyanBright,
          e.shipName ?? e.shipSymbol,
          <String>[
            if (e.rebuyCr != null) 'rebuy ${formatCredits(e.rebuyCr!)}',
            if (e.maxJumpRangeLy != null)
              '${e.maxJumpRangeLy!.toStringAsFixed(1)} LY',
            if (e.isHot) 'recherché',
          ].join(' · '),
        ),
      final ShipLockerEvent e => (
          Icons.inventory_2_outlined,
          EdColors.textMuted,
          'Inventaire à pied',
          e.isEmpty
              ? 'mise à jour signalée, contenu dans ShipLocker.json'
              : '${e.everything.length} type(s) de ressource',
        ),
      final MaterialsEvent e => (
          Icons.science_outlined,
          EdColors.textMuted,
          'Matériaux du vaisseau',
          '${e.everything.length} type(s)',
        ),
      final PowerplayEvent e => (
          Icons.flag_outlined,
          e.boostsOrganicSales ? EdColors.greenBright : EdColors.textMuted,
          'Powerplay — ${e.power}',
          <String>[
            if (e.rank != null) 'rang ${e.rank}',
            if (e.merits != null) '${e.merits} mérites',
            if (e.boostsOrganicSales) '+30 % sur les ventes organiques',
          ].join(' · '),
        ),
      final StoredShipsEvent e => (
          Icons.warehouse_outlined,
          EdColors.textMuted,
          'Flotte stockée',
          '${e.all.length} vaisseau(x)'
              '${e.stationName == null ? '' : ' · ${e.stationName}'}',
        ),
      final CargoEvent e => (
          Icons.inventory_outlined,
          e.hasMetaAlloy ? EdColors.greenBright : EdColors.textMuted,
          'Soute',
          e.hasMetaAlloy
              ? 'Meta-Alloy à bord — Felicity Farseer déblocable'
              : '${e.count} tonne(s)',
        ),
      final LocationEvent e => (
          e.docked ? Icons.anchor : Icons.place_outlined,
          EdColors.cyan,
          e.bodyName ?? e.starSystem ?? e.name,
          <String>[
            if (e.starSystem != null && e.bodyName != null) e.starSystem!,
            if (e.stationName case final String station) station,
            if (e.bodyType case final String type) type,
          ].join(' · '),
        ),
      final DockedEvent e => (
          Icons.anchor,
          e.sellsOrganicData ? EdColors.greenBright : EdColors.cyanBright,
          'Amarrage — ${e.stationName}',
          <String>[
            if (e.stationType case final String type) type,
            if (e.starSystem case final String system) system,
            if (e.sellsOrganicData) 'Vista Genomics',
          ].join(' · '),
        ),
      final DiedEvent e => (
          Icons.heart_broken_outlined,
          EdColors.red,
          'Mort du commandant',
          e.killerName ?? e.killerShip,
        ),
      final ResurrectEvent e => (
          Icons.refresh,
          e.losesUnsoldData ? EdColors.red : EdColors.textMuted,
          e.losesUnsoldData
              ? 'Vaisseau perdu — données bio non vendues effacées'
              : 'Retour au jeu',
          e.costCr > 0 ? formatCredits(e.costCr) : null,
        ),
      final UnknownJournalEvent e => (
          Icons.circle_outlined,
          EdColors.textFainter,
          e.name,
          null,
        ),
    };
  }

  static String _time(DateTime timestamp) {
    final DateTime local = timestamp.toLocal();
    return '${local.day.toString().padLeft(2, '0')}/'
        '${local.month.toString().padLeft(2, '0')} '
        '${local.hour.toString().padLeft(2, '0')}:'
        '${local.minute.toString().padLeft(2, '0')}';
  }
}
