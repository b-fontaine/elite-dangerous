import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/responsive/adaptive.dart';
import '../../../../core/responsive/window_size.dart';
import '../../../../design_system/design_system.dart';
import '../../../commander/domain/entities/commander.dart';
import '../../../commander/presentation/bloc/commander_bloc.dart';
import '../../../journal/domain/entities/journal_session_state.dart';

/// Everything the cockpit and its detail pages read about the commander.
///
/// Two sources, deliberately kept apart: [commander] is what Frontier's
/// `/profile` returned, [session] is what the journal proved. Neither is a
/// superset of the other, and a screen showing a figure should be able to say
/// which one it came from.
class CommanderDossier {
  const CommanderDossier({
    required this.commander,
    required this.session,
    this.isRefreshing = false,
  });

  const CommanderDossier.unknown()
      : commander = const Commander.unknown(),
        session = const JournalSessionState.empty(),
        isRefreshing = false;

  final Commander commander;
  final JournalSessionState session;
  final bool isRefreshing;

  bool get isKnown => commander.isKnown || !session.isEmpty;
}

/// Provides a [CommanderBloc] and hands its content to [builder].
///
/// Each detail page opens on its own navigation entry, so each needs its own
/// provider; this is that boilerplate, written once.
class CommanderScope extends StatelessWidget {
  const CommanderScope({required this.builder, super.key});

  final Widget Function(BuildContext context, CommanderDossier dossier) builder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CommanderBloc>(
      create: (_) => getIt<CommanderBloc>()..add(const CommanderWatchStarted()),
      child: BlocBuilder<CommanderBloc, CommanderState>(
        builder: (BuildContext context, CommanderState state) => builder(
          context,
          switch (state) {
            CommanderReady(
              :final Commander commander,
              :final JournalSessionState session,
              :final bool isRefreshing,
            ) =>
              CommanderDossier(
                commander: commander,
                session: session,
                isRefreshing: isRefreshing,
              ),
            _ => const CommanderDossier.unknown(),
          },
        ),
      ),
    );
  }
}

/// A detail page: a header, then content, at a readable width.
///
/// The five of them share this so they read as one screen split in five rather
/// than five screens.
class DetailPageScaffold extends StatelessWidget {
  const DetailPageScaffold({
    required this.kicker,
    required this.title,
    required this.slivers,
    this.deck,
    this.actions = const <Widget>[],
    super.key,
  });

  final String kicker;
  final String title;
  final String? deck;
  final List<Widget> actions;
  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: EdPageHeader(
            kicker: kicker,
            title: title,
            deck: deck,
            actions: actions,
          ),
        ),
        ...slivers,
        const SliverToBoxAdapter(child: SizedBox(height: EdSpacing.xxxl)),
      ],
    );
  }
}

/// Wraps [child] in the column width the rest of the app reads at.
class DetailSection extends StatelessWidget {
  const DetailSection({
    required this.child,
    this.top = EdSpacing.xxl,
    super.key,
  });

  final Widget child;
  final double top;

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: ReadableWidth(
          maxWidth: Breakpoints.contentColumn,
          child: Padding(
            padding: EdgeInsets.only(top: top),
            child: child,
          ),
        ),
      );
}

/// States that a value is missing, and says what would supply it.
///
/// Used wherever the CAPI is silent — weapon grades, a stored ship's fitting,
/// engineers before a journal import. A blank panel reads as a bug; this reads
/// as an instruction.
class MissingDataNote extends StatelessWidget {
  const MissingDataNote({
    required this.what,
    required this.remedy,
    this.tone = EdCalloutTone.info,
    super.key,
  });

  final String what;
  final String remedy;
  final EdCalloutTone tone;

  @override
  Widget build(BuildContext context) => EdCallout(
        tone: tone,
        title: what,
        child: Text(remedy, style: EdTypography.bodySmall),
      );
}
