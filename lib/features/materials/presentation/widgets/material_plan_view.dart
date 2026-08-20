import 'package:flutter/material.dart';

import '../../../../core/format/credits.dart';
import '../../../../design_system/design_system.dart';
// `FactRow` is the cockpit's label-and-figure line. Reused rather than
// copied so a materials panel reads exactly like the rest of the dossier.
import '../../../dashboard/presentation/widgets/summary_card.dart';
import '../../domain/entities/engineering_material.dart';
import '../../domain/entities/material_plan.dart';

/// The shortfall table: every line of a plan, scarcest first.
class MaterialPlanTable extends StatelessWidget {
  const MaterialPlanTable({required this.plan, super.key});

  final MaterialPlan plan;

  @override
  Widget build(BuildContext context) {
    if (plan.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (final MaterialRequirement line in plan.requirements)
          FactRow(
            label: line.material.name,
            hint: _hint(line.material),
            value: '${line.owned} / ${line.needed}',
            tone: line.satisfied ? EdColors.greenBright : EdColors.amber,
          ),
        if (plan.creditsCr case final int credits) ...<Widget>[
          const SizedBox(height: EdSpacing.xs),
          FactRow(
            label: 'Crédits',
            hint: plan.creditsCaveat,
            value: formatCredits(credits),
          ),
        ],
        if (plan.unknownMaterialIds.isNotEmpty) ...<Widget>[
          const SizedBox(height: EdSpacing.sm),
          EdCallout.text(
            tone: EdCalloutTone.warning,
            title: 'Recette incomplète',
            text: 'La base de données ne connaît pas '
                '${plan.unknownMaterialIds.join(', ')}. Le total affiché est '
                'donc inférieur au coût réel.',
          ),
        ],
      ],
    );
  }

  static String? _hint(EngineeringMaterial material) {
    final List<String> parts = <String>[
      material.type.label,
      if (material.grade case final int grade) 'grade $grade',
      if (material.odysseyCategory case final String category) category,
    ];
    return parts.join(' · ');
  }
}

/// What a trader could convert to close part of the gap.
class MaterialConversionsPanel extends StatelessWidget {
  const MaterialConversionsPanel({required this.plan, super.key});

  final MaterialPlan plan;

  @override
  Widget build(BuildContext context) {
    if (plan.conversions.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const EdSectionHeader(title: 'À échanger chez le trader'),
        const SizedBox(height: EdSpacing.md),
        EdPanel(
          accent: EdColors.cyan,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Seul le surplus est proposé : rien de ce que le plan demande '
                'lui-même n\'est mis à l\'échange.',
                style: EdTypography.caption,
              ),
              const SizedBox(height: EdSpacing.xs),
              for (final TraderConversion trade in plan.conversions)
                FactRow(
                  label: '${trade.from.name} → ${trade.to.name}',
                  hint: 'Taux ${trade.rate} · trader '
                      '${trade.from.type.label.toLowerCase()}',
                  value: '−${trade.spend} / +${trade.receive}',
                  tone: EdColors.cyanBright,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
