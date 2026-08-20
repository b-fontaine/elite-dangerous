import 'package:flutter/material.dart';

import '../../../../design_system/design_system.dart';
import '../../domain/entities/engineering_material.dart';
import '../../domain/entities/material_catalog.dart';
import '../../domain/entities/material_plan.dart';

/// "Where do I find the ones I am missing?" — the question the old materials
/// screen could not answer.
///
/// Grouped by trader category rather than listed per material, because most of
/// what is worth saying is shared: the four Wake Scans of an FSD blueprint all
/// come from the same scanner, and printing that paragraph four times buries
/// the one line that differs.
class MissingMaterialsGuide extends StatelessWidget {
  const MissingMaterialsGuide({
    required this.catalog,
    required this.plan,
    super.key,
  });

  final MaterialCatalog catalog;
  final MaterialPlan plan;

  @override
  Widget build(BuildContext context) {
    final List<MaterialRequirement> missing = plan.missing.toList();
    if (missing.isEmpty) {
      return const SizedBox.shrink();
    }

    // Insertion-ordered, so the scarcest material still leads.
    final Map<String, List<MaterialRequirement>> byCategory =
        <String, List<MaterialRequirement>>{};
    for (final MaterialRequirement line in missing) {
      byCategory
          .putIfAbsent(line.material.categoryId, () => <MaterialRequirement>[])
          .add(line);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const EdSectionHeader(title: 'Où trouver ce qui manque'),
        const SizedBox(height: EdSpacing.md),
        for (final MapEntry<String, List<MaterialRequirement>> group
            in byCategory.entries)
          Padding(
            padding: const EdgeInsets.only(bottom: EdSpacing.md),
            child: _CategoryGuide(
              catalog: catalog,
              lines: group.value,
            ),
          ),
      ],
    );
  }
}

class _CategoryGuide extends StatelessWidget {
  const _CategoryGuide({required this.catalog, required this.lines});

  final MaterialCatalog catalog;
  final List<MaterialRequirement> lines;

  @override
  Widget build(BuildContext context) {
    final EngineeringMaterial first = lines.first.material;
    final MaterialCategory? category = catalog.categoryOf(first);

    return EdPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          EdSubHeader(
            category == null
                ? first.name
                : '${category.name} · ${first.type.label.toLowerCase()}',
          ),
          const SizedBox(height: EdSpacing.xxs),
          Text(
            lines
                .map((MaterialRequirement line) =>
                    '${line.material.name} ×${line.missing}')
                .join(' · '),
            style: EdTypography.bodySmall.copyWith(color: EdColors.amber),
          ),
          const SizedBox(height: EdSpacing.sm),

          // What is true of one of these materials specifically.
          for (final MaterialRequirement line in lines)
            if (line.material.sources.isNotEmpty)
              _SourceBlock(
                label: line.material.name,
                sources: line.material.sources,
              ),

          // What is true of the whole family, said once.
          if (category != null)
            for (final MaterialSource source in category.sources)
              _SourceLine(source: source),
        ],
      ),
    );
  }
}

class _SourceBlock extends StatelessWidget {
  const _SourceBlock({required this.label, required this.sources});

  final String label;
  final List<MaterialSource> sources;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(label, style: EdTypography.caption),
          for (final MaterialSource source in sources)
            _SourceLine(source: source),
        ],
      );
}

class _SourceLine extends StatelessWidget {
  const _SourceLine({required this.source});

  final MaterialSource source;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: EdSpacing.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            EdTag(label: source.kind.label),
            const SizedBox(width: EdSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(source.detail, style: EdTypography.bodySmall),
                  if (source.conditions case final String conditions)
                    Padding(
                      padding: const EdgeInsets.only(top: EdSpacing.xxs),
                      child: Text(conditions, style: EdTypography.caption),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
}
