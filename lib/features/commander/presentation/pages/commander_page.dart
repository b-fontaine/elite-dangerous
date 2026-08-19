import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/responsive/adaptive.dart';
import '../../../../core/responsive/window_size.dart';
import '../../../../design_system/design_system.dart';
import '../../../exobiology/presentation/widgets/credits_format.dart';
import '../../domain/entities/commander.dart';
import '../../domain/entities/rank.dart';
import '../../domain/entities/suit_info.dart';
import '../bloc/commander_bloc.dart';

/// The commander's own record: identity, ranks, suits, and where the data came
/// from.
class CommanderPage extends StatelessWidget {
  const CommanderPage({this.onEditProfile, super.key});

  final VoidCallback? onEditProfile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CommanderBloc>(
      create: (_) => getIt<CommanderBloc>()..add(const CommanderWatchStarted()),
      child: _CommanderView(onEditProfile: onEditProfile),
    );
  }
}

class _CommanderView extends StatelessWidget {
  const _CommanderView({this.onEditProfile});

  final VoidCallback? onEditProfile;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommanderBloc, CommanderState>(
      builder: (BuildContext context, CommanderState state) {
        return switch (state) {
          CommanderInitial() || CommanderLoading() => const EdLoadingView(),
          CommanderError(:final failure) => EdErrorView(
              message: failure.message,
              onRetry: () => context
                  .read<CommanderBloc>()
                  .add(const CommanderWatchStarted()),
            ),
          CommanderReady(:final Commander commander) => CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: EdPageHeader(
                    kicker: 'Dossier de pilote',
                    title: commander.isKnown ? commander.name : 'Commandant',
                    deck: 'Source : ${commander.source.label}'
                        '${commander.lastSyncedAt == null ? '' : ' · '
                            'synchronisé le '
                            '${_formatDate(commander.lastSyncedAt!)}'}',
                    actions: <Widget>[
                      if (onEditProfile != null)
                        FilledButton.icon(
                          onPressed: onEditProfile,
                          icon: const Icon(Icons.edit_outlined, size: 15),
                          label: const Text('Compléter mon profil'),
                        ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: ReadableWidth(
                    maxWidth: Breakpoints.contentColumn,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: EdSpacing.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          if (!commander.isKnown)
                            const EdCallout(
                              tone: EdCalloutTone.info,
                              title: 'Profil vide',
                              child: Text(
                                'Aucune donnée n\'a encore été récupérée. '
                                'Connecte ton compte Frontier, importe des '
                                'journaux de bord, ou renseigne ton profil à '
                                'la main : la feuille de route s\'adapte à '
                                'chacune de ces sources.',
                                style: EdTypography.bodySmall,
                              ),
                            ),
                          const SizedBox(height: EdSpacing.lg),
                          const EdSectionHeader(title: 'Rangs'),
                          const SizedBox(height: EdSpacing.md),
                          EdPanel(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                for (final RankType type in RankType.values)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: EdSpacing.md,
                                    ),
                                    child: EdProgressBar(
                                      progress:
                                          commander.rank(type)?.fraction ?? 0,
                                      label: type.label,
                                      trailingLabel:
                                          commander.rank(type)?.name ??
                                              type.names.first,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(height: EdSpacing.xxl),
                          const EdSectionHeader(title: 'Combinaisons'),
                          const SizedBox(height: EdSpacing.md),
                          _SuitList(commander: commander),
                          const SizedBox(height: EdSpacing.xxl),
                          const EdSectionHeader(title: 'Finances'),
                          const SizedBox(height: EdSpacing.md),
                          AdaptiveGrid(
                            minTileWidth: 200,
                            children: <Widget>[
                              EdStatTile(
                                label: 'Solde',
                                value: formatCredits(commander.credits),
                                icon: Icons.account_balance_wallet_outlined,
                                hint: formatCreditsExact(commander.credits),
                              ),
                              EdStatTile(
                                label: 'Dette',
                                value: formatCredits(commander.debt),
                                icon: Icons.money_off,
                                valueColor: commander.debt > 0
                                    ? EdColors.redBright
                                    : EdColors.textFaint,
                              ),
                            ],
                          ),
                          const SizedBox(height: EdSpacing.xxxl),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
        };
      },
    );
  }

  static String _formatDate(DateTime date) =>
      '${date.day.toString().padLeft(2, '0')}/'
      '${date.month.toString().padLeft(2, '0')} à '
      '${date.hour.toString().padLeft(2, '0')}h'
      '${date.minute.toString().padLeft(2, '0')}';
}

class _SuitList extends StatelessWidget {
  const _SuitList({required this.commander});

  final Commander commander;

  @override
  Widget build(BuildContext context) {
    if (commander.suits.isEmpty) {
      return const EdEmptyView(
        icon: Icons.checkroom_outlined,
        title: 'Aucune combinaison connue',
        message: 'La combinaison n\'est exposée que par la Companion API, ou '
            'par ta saisie manuelle.',
      );
    }
    return AdaptiveGrid(
      minTileWidth: 260,
      children: <Widget>[
        for (final SuitInfo suit in commander.suits)
          EdPanel(
            notch: EdNotch.tile,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        suit.displayName ?? suit.kind.label,
                        style: EdTypography.titleMedium,
                      ),
                    ),
                    if (suit.isArtemis)
                      const EdTag(
                        label: 'Exobio',
                        background: EdColors.tagGreenFill,
                        foreground: EdColors.greenBright,
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(suit.kind.role, style: EdTypography.caption),
                const SizedBox(height: EdSpacing.xs),
                Text(
                  'Grade ${suit.grade} · '
                  '${suit.modIds.length}/${suit.modificationSlots} mods',
                  style: EdTypography.numeric.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
