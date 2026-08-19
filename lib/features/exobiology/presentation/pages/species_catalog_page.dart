import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/responsive/adaptive.dart';
import '../../../../core/responsive/window_size.dart';
import '../../../../design_system/design_system.dart';
import '../../domain/entities/exobiology_catalog.dart';
import '../../domain/entities/genus.dart';
import '../../domain/entities/organic_species.dart';
import '../../domain/entities/species_variant.dart';
import '../bloc/species_catalog_bloc.dart';
import '../widgets/credits_format.dart';

/// The reference table: every organic, its payout and its colony range.
class SpeciesCatalogPage extends StatelessWidget {
  const SpeciesCatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SpeciesCatalogBloc>(
      create: (_) =>
          getIt<SpeciesCatalogBloc>()..add(const SpeciesCatalogRequested()),
      child: const _CatalogView(),
    );
  }
}

class _CatalogView extends StatelessWidget {
  const _CatalogView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeciesCatalogBloc, SpeciesCatalogState>(
      builder: (BuildContext context, SpeciesCatalogState state) {
        return switch (state) {
          SpeciesCatalogInitial() ||
          SpeciesCatalogLoading() =>
            const EdLoadingView(),
          SpeciesCatalogError(:final failure) => EdErrorView(
              message: failure.message,
              onRetry: () => context
                  .read<SpeciesCatalogBloc>()
                  .add(const SpeciesCatalogRequested()),
            ),
          final SpeciesCatalogReady ready => _CatalogBody(state: ready),
        };
      },
    );
  }
}

class _CatalogBody extends StatelessWidget {
  const _CatalogBody({required this.state});

  final SpeciesCatalogReady state;

  @override
  Widget build(BuildContext context) {
    final List<OrganicSpecies> species = state.species;

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: EdPageHeader(
            kicker: 'Catalogue · édition ${state.catalog.edition}',
            title: 'Espèces',
            deck: '${state.catalog.species.length} organiques répertoriés, '
                'répartis en ${state.catalog.genera.length} genres. '
                'Valeurs Vista Genomics et Colony Range par genre.',
          ),
        ),
        SliverToBoxAdapter(
          child: ReadableWidth(
            maxWidth: Breakpoints.contentColumn,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: EdSpacing.lg),
              child: _Toolbar(state: state),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: ReadableWidth(
            maxWidth: Breakpoints.contentColumn,
            child: species.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(EdSpacing.xxl),
                    child: EdEmptyView(
                      icon: Icons.biotech_outlined,
                      title: 'Aucune espèce',
                      message: 'Aucune espèce ne correspond à ce filtre.',
                    ),
                  )
                : AdaptiveGrid(
                    minTileWidth: 340,
                    children: <Widget>[
                      for (final OrganicSpecies item in species)
                        _SpeciesTile(
                          species: item,
                          genus: state.genusOf(item),
                        ),
                    ],
                  ),
          ),
        ),
        SliverToBoxAdapter(
          child: ReadableWidth(
            maxWidth: Breakpoints.contentColumn,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: EdSpacing.xxl),
              child: _ColonyRangeTable(catalog: state.catalog),
            ),
          ),
        ),
      ],
    );
  }
}

class _Toolbar extends StatelessWidget {
  const _Toolbar({required this.state});

  final SpeciesCatalogReady state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextField(
          onChanged: (String value) => context
              .read<SpeciesCatalogBloc>()
              .add(SpeciesCatalogQueryChanged(value)),
          style: EdTypography.bodySmall,
          decoration: const InputDecoration(
            hintText: 'Chercher une espèce ou un genre…',
            prefixIcon: Icon(Icons.search, size: 18),
          ),
        ),
        const SizedBox(height: EdSpacing.sm),
        Wrap(
          spacing: EdSpacing.xs,
          runSpacing: EdSpacing.xs,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            for (final SpeciesSort sort in SpeciesSort.values)
              ChoiceChip(
                selected: state.sort == sort,
                showCheckmark: false,
                selectedColor: EdColors.tagOrangeFill,
                onSelected: (_) => context
                    .read<SpeciesCatalogBloc>()
                    .add(SpeciesCatalogSortChanged(sort)),
                label: Text(
                  sort.label,
                  style: EdTypography.tag.copyWith(
                    fontSize: 10,
                    letterSpacing: 1.4,
                    color: state.sort == sort
                        ? EdColors.orangeBright
                        : EdColors.textMuted,
                  ),
                ),
              ),
            FilterChip(
              selected: state.highValueOnly,
              showCheckmark: false,
              selectedColor: EdColors.tagGreenFill,
              onSelected: (bool value) => context
                  .read<SpeciesCatalogBloc>()
                  .add(SpeciesCatalogHighValueToggled(value)),
              label: Text(
                '≥ 16 M Cr',
                style: EdTypography.tag.copyWith(
                  fontSize: 10,
                  letterSpacing: 1.4,
                  color: state.highValueOnly
                      ? EdColors.greenBright
                      : EdColors.textMuted,
                ),
              ),
            ),
            Text(
              '${state.species.length} résultat(s)',
              style: EdTypography.caption,
            ),
          ],
        ),
      ],
    );
  }
}

class _SpeciesTile extends StatelessWidget {
  const _SpeciesTile({required this.species, required this.genus});

  final OrganicSpecies species;
  final Genus? genus;

  @override
  Widget build(BuildContext context) {
    return EdPanel(
      notch: EdNotch.tile,
      padding: const EdgeInsets.fromLTRB(
        EdSpacing.md,
        EdSpacing.sm,
        EdSpacing.md,
        EdSpacing.sm,
      ),
      onTap: () => showDialog<void>(
        context: context,
        builder: (_) => _SpeciesDialog(species: species, genus: genus),
      ),
      semanticLabel: species.name,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  species.name,
                  style: EdTypography.titleMedium,
                ),
              ),
              if (species.isHighValue)
                const EdTag(
                  label: 'Haute valeur',
                  background: EdColors.tagGreenFill,
                  foreground: EdColors.greenBright,
                ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: <Widget>[
              Text(
                formatCredits(species.baseValueCr),
                style: EdTypography.numeric,
              ),
              const SizedBox(width: EdSpacing.sm),
              if (genus != null)
                Text(
                  '${genus!.name} · ${genus!.colonyRangeMeters} m',
                  style: EdTypography.caption,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SpeciesDialog extends StatelessWidget {
  const _SpeciesDialog({required this.species, required this.genus});

  final OrganicSpecies species;
  final Genus? genus;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(species.name),
      content: SizedBox(
        width: 460,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              EdDataTable(
                headers: const <String>['Donnée', 'Valeur'],
                rows: <List<EdCell>>[
                  <EdCell>[
                    const EdCell('Genre'),
                    EdCell(species.genusName, strong: true),
                  ],
                  if (genus != null)
                    <EdCell>[
                      const EdCell('Colony Range'),
                      EdCell.number('${genus!.colonyRangeMeters} m'),
                    ],
                  <EdCell>[
                    const EdCell('Valeur de base'),
                    EdCell.number(formatCreditsExact(species.baseValueCr)),
                  ],
                  <EdCell>[
                    const EdCell('First Logged (×5)'),
                    EdCell.number(
                      formatCreditsExact(species.firstLoggedValueCr),
                    ),
                  ],
                  <EdCell>[
                    const EdCell('Échantillons'),
                    EdCell.number('${genus?.sampleCount ?? 3}'),
                  ],
                ],
              ),
              const SizedBox(height: EdSpacing.md),
              const EdSubHeader('Conditions'),
              const SizedBox(height: EdSpacing.xs),
              _ConditionsList(species: species),
              if (species.variants.isNotEmpty) ...<Widget>[
                const SizedBox(height: EdSpacing.md),
                const EdSubHeader('Variantes'),
                const SizedBox(height: EdSpacing.xs),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: <Widget>[
                    for (final SpeciesVariant variant in species.variants)
                      EdTag(
                        label: variant.colour,
                        background: EdColors.panelHeader,
                        foreground: EdColors.cyanBright,
                        tooltip: variant.material != null
                            ? 'Matériau : ${variant.material}'
                            : 'Étoile : '
                                '${variant.starClasses.map((s) => s.code).join(", ")}',
                      ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Fermer'),
        ),
      ],
    );
  }
}

class _ConditionsList extends StatelessWidget {
  const _ConditionsList({required this.species});

  final OrganicSpecies species;

  @override
  Widget build(BuildContext context) {
    final List<String> lines = <String>[
      if (species.conditions.planetClasses.isNotEmpty)
        'Corps : ${species.conditions.planetClasses.map((c) => c.label).join(" / ")}',
      if (species.conditions.atmospheres.isNotEmpty)
        'Atmosphère : ${species.conditions.atmospheres.map((a) => a.label).join(" / ")}',
      if (species.conditions.minTemperatureK != null ||
          species.conditions.maxTemperatureK != null)
        'Température : '
            '${species.conditions.minTemperatureK?.toStringAsFixed(0) ?? "—"} – '
            '${species.conditions.maxTemperatureK?.toStringAsFixed(0) ?? "—"} K',
      if (species.conditions.maxGravityG != null)
        'Gravité max : ${species.conditions.maxGravityG!.toStringAsFixed(3)} g',
      if (species.conditions.volcanism.isNotEmpty)
        'Volcanisme : ${species.conditions.volcanism.map((v) => v.label).join(" / ")}',
      if (species.conditions.minDistanceFromArrivalLs != null)
        'Distance : > '
            '${species.conditions.minDistanceFromArrivalLs!.toStringAsFixed(0)} sl',
      if (species.conditions.requiresNebula) 'Proximité d\'une nébuleuse',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (lines.isEmpty)
          const Text(
            'Conditions non documentées pour cette espèce.',
            style: EdTypography.caption,
          ),
        for (final String line in lines)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text('• $line', style: EdTypography.bodySmall),
          ),
        if (species.conditions.notes case final String notes) ...<Widget>[
          const SizedBox(height: EdSpacing.xs),
          Text(notes, style: EdTypography.caption),
        ],
      ],
    );
  }
}

/// The table every exobiologist needs memorised.
class _ColonyRangeTable extends StatelessWidget {
  const _ColonyRangeTable({required this.catalog});

  final ExobiologyCatalog catalog;

  @override
  Widget build(BuildContext context) {
    final Map<int, List<String>> byRange = <int, List<String>>{};
    for (final Genus genus in catalog.genera) {
      byRange.putIfAbsent(genus.colonyRangeMeters, () => <String>[])
          .add(genus.name);
    }
    final List<int> ranges = byRange.keys.toList()..sort();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const EdSectionHeader(title: 'Colony Range par genre'),
        const SizedBox(height: EdSpacing.md),
        EdDataTable(
          headers: const <String>['Distance', 'Genres concernés'],
          caption: 'Distance minimale à parcourir entre deux prélèvements de '
              'la même espèce. « Insufficient genetic diversity » signifie '
              'que tu es trop près du précédent.',
          columnWidths: const <double>[110, 420],
          rows: <List<EdCell>>[
            for (final int range in ranges)
              <EdCell>[
                EdCell.number('$range m'),
                EdCell((byRange[range]!..sort()).join(', ')),
              ],
          ],
        ),
      ],
    );
  }
}
