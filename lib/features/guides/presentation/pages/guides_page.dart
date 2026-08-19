import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/responsive/adaptive.dart';
import '../../../../design_system/design_system.dart';
import '../../domain/entities/guide.dart';
import '../bloc/guides_bloc.dart';

/// The guide library.
class GuidesPage extends StatelessWidget {
  const GuidesPage({this.onOpenGuide, super.key});

  final void Function(String guideId)? onOpenGuide;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GuidesBloc>(
      create: (_) => getIt<GuidesBloc>()..add(const GuidesRequested()),
      child: const _GuidesView(),
    );
  }
}

class _GuidesView extends StatelessWidget {
  const _GuidesView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuidesBloc, GuidesState>(
      builder: (BuildContext context, GuidesState state) {
        return CustomScrollView(
          slivers: <Widget>[
            const SliverToBoxAdapter(
              child: EdPageHeader(
                kicker: 'Bibliothèque',
                title: 'Guides',
                deck: 'Les manuels de terrain, hors ligne et à jour de '
                    'l\'édition d\'août 2026.',
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  EdSpacing.lg,
                  EdSpacing.lg,
                  EdSpacing.lg,
                  EdSpacing.xs,
                ),
                child: _SearchField(
                  onChanged: (String query) => context
                      .read<GuidesBloc>()
                      .add(GuidesSearchChanged(query)),
                ),
              ),
            ),
            switch (state) {
              GuidesInitial() ||
              GuidesLoading() =>
                const SliverFillRemaining(child: EdLoadingView()),
              GuidesError(:final failure) => SliverFillRemaining(
                  child: EdErrorView(
                    message: failure.message,
                    onRetry: () => context
                        .read<GuidesBloc>()
                        .add(const GuidesRequested()),
                  ),
                ),
              GuidesReady(:final List<GuideSummary> guides, :final bool isFiltered)
                  when guides.isEmpty =>
                SliverFillRemaining(
                  child: EdEmptyView(
                    icon: Icons.menu_book_outlined,
                    title: isFiltered ? 'Aucun résultat' : 'Aucun guide',
                    message: isFiltered
                        ? 'Aucun guide ne correspond à cette recherche.'
                        : 'La bibliothèque est vide.',
                  ),
                ),
              GuidesReady(:final List<GuideSummary> guides) =>
                SliverPadding(
                  padding: const EdgeInsets.all(EdSpacing.lg),
                  sliver: SliverToBoxAdapter(
                    child: AdaptiveGrid(
                      minTileWidth: 320,
                      children: <Widget>[
                        for (final GuideSummary guide in guides)
                          _GuideCard(guide: guide),
                      ],
                    ),
                  ),
                ),
            },
          ],
        );
      },
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: EdTypography.bodySmall,
      decoration: const InputDecoration(
        hintText: 'Chercher un guide, un sujet, une espèce…',
        prefixIcon: Icon(Icons.search, size: 18),
      ),
    );
  }
}

class _GuideCard extends StatelessWidget {
  const _GuideCard({required this.guide});

  final GuideSummary guide;

  @override
  Widget build(BuildContext context) {
    return EdPanel(
      onTap: () => Navigator.of(context).pushNamed('/guides/${guide.id}'),
      semanticLabel: guide.title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(guide.title, style: EdTypography.titleLarge),
          if (guide.deck != null) ...<Widget>[
            const SizedBox(height: EdSpacing.xs),
            Text(
              guide.deck!,
              style: EdTypography.bodySmall,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          const SizedBox(height: EdSpacing.md),
          Row(
            children: <Widget>[
              const Icon(
                Icons.schedule,
                size: 13,
                color: EdColors.textFainter,
              ),
              const SizedBox(width: 5),
              Text(
                '${guide.estimatedReadMinutes} min',
                style: EdTypography.caption,
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward,
                size: 15,
                color: EdColors.orangeBright,
              ),
            ],
          ),
          if (guide.topics.isNotEmpty) ...<Widget>[
            const SizedBox(height: EdSpacing.sm),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: <Widget>[
                for (final String topic in guide.topics)
                  EdTag(
                    label: topic,
                    background: EdColors.panelHeader,
                    foreground: EdColors.cyanBright,
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
