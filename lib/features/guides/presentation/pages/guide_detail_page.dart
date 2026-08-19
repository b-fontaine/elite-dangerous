import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/responsive/adaptive.dart';
import '../../../../core/responsive/window_size.dart';
import '../../../../design_system/design_system.dart';
import '../../domain/entities/guide.dart';
import '../bloc/guide_detail_bloc.dart';
import '../widgets/guide_block_view.dart';
import '../widgets/guide_toc.dart';

/// One guide, rendered in full.
class GuideDetailPage extends StatelessWidget {
  const GuideDetailPage({required this.guideId, super.key});

  final String guideId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GuideDetailBloc>(
      create: (_) =>
          getIt<GuideDetailBloc>()..add(GuideDetailRequested(guideId)),
      child: const _GuideDetailView(),
    );
  }
}

class _GuideDetailView extends StatefulWidget {
  const _GuideDetailView();

  @override
  State<_GuideDetailView> createState() => _GuideDetailViewState();
}

class _GuideDetailViewState extends State<_GuideDetailView> {
  final Map<String, GlobalKey> _sectionKeys = <String, GlobalKey>{};
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  GlobalKey _keyFor(String sectionId) =>
      _sectionKeys.putIfAbsent(sectionId, GlobalKey.new);

  Future<void> _scrollTo(String sectionId) async {
    final BuildContext? target = _keyFor(sectionId).currentContext;
    if (target == null) {
      return;
    }
    await Scrollable.ensureVisible(
      target,
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
      alignment: 0.05,
    );
    if (mounted) {
      context.read<GuideDetailBloc>().add(GuideSectionMarkedRead(sectionId));
    }
  }

  /// Marks every section whose header has scrolled past the top of the
  /// viewport as read, so the library can show real reading progress instead
  /// of a checkbox nobody would tick.
  void _markPassedSectionsRead(Guide guide) {
    for (final GuideSection section in guide.sections) {
      final BuildContext? sectionContext =
          _sectionKeys[section.id]?.currentContext;
      final RenderObject? box = sectionContext?.findRenderObject();
      if (box is! RenderBox || !box.hasSize) {
        continue;
      }
      final double top = box.localToGlobal(Offset.zero).dy;
      if (top < 120) {
        context.read<GuideDetailBloc>().add(GuideSectionMarkedRead(section.id));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuideDetailBloc, GuideDetailState>(
      builder: (BuildContext context, GuideDetailState state) {
        return switch (state) {
          GuideDetailInitial() || GuideDetailLoading() => const EdLoadingView(),
          GuideDetailError(:final failure) =>
            EdErrorView(message: failure.message),
          GuideDetailReady(:final Guide guide, :final Set<String> readSectionIds) =>
            ResponsiveBuilder(
              builder: (BuildContext context, WindowSizeClass size) {
                final Widget content = NotificationListener<ScrollEndNotification>(
                  onNotification: (_) {
                    _markPassedSectionsRead(guide);
                    return false;
                  },
                  child: _GuideBody(
                    guide: guide,
                    controller: _controller,
                    keyFor: _keyFor,
                  ),
                );

                if (!size.usesTwoPanes) {
                  return content;
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      width: 268,
                      child: GuideToc(
                        guide: guide,
                        readSectionIds: readSectionIds,
                        onSelect: _scrollTo,
                      ),
                    ),
                    const VerticalDivider(width: 1),
                    Expanded(child: content),
                  ],
                );
              },
            ),
        };
      },
    );
  }
}

class _GuideBody extends StatelessWidget {
  const _GuideBody({
    required this.guide,
    required this.controller,
    required this.keyFor,
  });

  final Guide guide;
  final ScrollController controller;
  final GlobalKey Function(String sectionId) keyFor;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: EdPageHeader(
            kicker: guide.kicker,
            title: guide.title,
            deck: guide.deck,
            byline: guide.byline,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: EdSpacing.xxxl),
          sliver: SliverList.builder(
            itemCount: guide.sections.length,
            itemBuilder: (BuildContext context, int index) {
              final GuideSection section = guide.sections[index];
              return _SectionView(
                key: keyFor(section.id),
                section: section,
              );
            },
          ),
        ),
        if (guide.sources.isNotEmpty)
          SliverToBoxAdapter(
            child: ReadableWidth(
              child: Padding(
                padding: const EdgeInsets.only(bottom: EdSpacing.xxl),
                child: EdPanel(
                  background: EdColors.panel,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const EdSubHeader('Sources'),
                      const SizedBox(height: EdSpacing.xs),
                      Text(
                        guide.sources.join(' · '),
                        style: EdTypography.caption,
                      ),
                      const SizedBox(height: EdSpacing.xs),
                      Text(
                        'Édition ${guide.edition}',
                        style: EdTypography.caption,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _SectionView extends StatelessWidget {
  const _SectionView({required this.section, super.key});

  final GuideSection section;

  @override
  Widget build(BuildContext context) {
    return ReadableWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: EdSpacing.section),
          EdSectionHeader(title: section.title, number: section.number),
          const SizedBox(height: EdSpacing.lg),
          for (final GuideBlock block in section.blocks)
            Padding(
              padding: const EdgeInsets.only(bottom: EdSpacing.paragraph),
              child: GuideBlockView(block),
            ),
        ],
      ),
    );
  }
}
