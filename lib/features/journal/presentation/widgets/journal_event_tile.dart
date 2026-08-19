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
          '${e.biologicalCount} signal(aux) biologique(s)'
              '${e.fromDetailedScan ? ' · DSS' : ' · FSS'}',
        ),
      final BodyScanEvent e => (
          Icons.public,
          EdColors.textMuted,
          e.bodyName,
          <String>[
            if (e.planetClass != null) e.planetClass!,
            if (e.surfaceGravityG != null)
              '${e.surfaceGravityG!.toStringAsFixed(2)} g',
            if (e.surfaceTemperatureK != null)
              '${e.surfaceTemperatureK!.toStringAsFixed(0)} K',
          ].join(' · '),
        ),
      final SurfaceContactEvent e => (
          e.isDisembark ? Icons.directions_walk : Icons.flight_land,
          EdColors.cyanBright,
          e.isDisembark ? 'Sortie à pied' : 'Atterrissage',
          e.bodyName,
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
