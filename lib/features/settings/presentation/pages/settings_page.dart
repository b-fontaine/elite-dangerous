import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/network/app_identity.dart';
import '../../../../core/responsive/adaptive.dart';
import '../../../../design_system/design_system.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/widgets/auth_status_banner.dart';
import '../../domain/entities/app_settings.dart';
import '../bloc/settings_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({this.onOpenFrontierConnection, super.key});

  final VoidCallback? onOpenFrontierConnection;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<SettingsBloc>(
          create: (_) =>
              getIt<SettingsBloc>()..add(const SettingsWatchStarted()),
        ),
        BlocProvider<AuthBloc>(
          create: (_) => getIt<AuthBloc>()..add(const AuthWatchStarted()),
        ),
      ],
      child: _SettingsView(
        onOpenFrontierConnection: onOpenFrontierConnection,
      ),
    );
  }
}

class _SettingsView extends StatelessWidget {
  const _SettingsView({this.onOpenFrontierConnection});

  final VoidCallback? onOpenFrontierConnection;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listenWhen: (SettingsState previous, SettingsState current) =>
          !previous.didReset && current.didReset,
      listener: (BuildContext context, SettingsState state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Données locales effacées.')),
        );
      },
      builder: (BuildContext context, SettingsState state) {
        final AppSettings settings = state.settings;

        return CustomScrollView(
          slivers: <Widget>[
            const SliverToBoxAdapter(
              child: EdPageHeader(
                kicker: 'Configuration',
                title: 'Réglages',
              ),
            ),
            SliverToBoxAdapter(
              child: ReadableWidth(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: EdSpacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const EdSectionHeader(title: 'Compte Frontier', number: 1),
                      const SizedBox(height: EdSpacing.md),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (BuildContext context, AuthState authState) {
                          if (authState is! AuthReady) {
                            return const EdLoadingView();
                          }
                          return AuthStatusBanner(
                            status: authState.status,
                            onConnect: onOpenFrontierConnection,
                            onDisconnect: () => context
                                .read<AuthBloc>()
                                .add(const AuthSignOutRequested()),
                          );
                        },
                      ),
                      const SizedBox(height: EdSpacing.xxl),
                      const EdSectionHeader(
                        title: 'Journaux de bord',
                        number: 2,
                      ),
                      const SizedBox(height: EdSpacing.md),
                      EdPanel(
                        child: Column(
                          children: <Widget>[
                            SwitchListTile.adaptive(
                              contentPadding: EdgeInsets.zero,
                              value: settings.autoSyncOnLaunch,
                              onChanged: (bool value) => context
                                  .read<SettingsBloc>()
                                  .add(
                                    SettingsChanged(
                                      settings.copyWith(
                                        autoSyncOnLaunch: value,
                                      ),
                                    ),
                                  ),
                              title: const Text(
                                'Synchroniser au lancement',
                                style: EdTypography.bodySmall,
                              ),
                              subtitle: const Text(
                                'Désactivé par défaut : Frontier limite la '
                                'Companion API à environ une requête par '
                                'minute.',
                                style: EdTypography.caption,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: EdSpacing.xxl),
                      const EdSectionHeader(title: 'Affichage', number: 3),
                      const SizedBox(height: EdSpacing.md),
                      EdPanel(
                        child: Column(
                          children: <Widget>[
                            SwitchListTile.adaptive(
                              contentPadding: EdgeInsets.zero,
                              value: settings.showReliabilityTags,
                              onChanged: (bool value) => context
                                  .read<SettingsBloc>()
                                  .add(
                                    SettingsChanged(
                                      settings.copyWith(
                                        showReliabilityTags: value,
                                      ),
                                    ),
                                  ),
                              title: const Text(
                                'Afficher les tags de fiabilité',
                                style: EdTypography.bodySmall,
                              ),
                              subtitle: const Text(
                                'OFF (Frontier), COM (communauté), '
                                'EST (estimation).',
                                style: EdTypography.caption,
                              ),
                            ),
                            SwitchListTile.adaptive(
                              contentPadding: EdgeInsets.zero,
                              value: settings.compactDensity,
                              onChanged: (bool value) => context
                                  .read<SettingsBloc>()
                                  .add(
                                    SettingsChanged(
                                      settings.copyWith(compactDensity: value),
                                    ),
                                  ),
                              title: const Text(
                                'Densité compacte',
                                style: EdTypography.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: EdSpacing.xxl),
                      const EdSectionHeader(
                        title: 'Données locales',
                        number: 4,
                      ),
                      const SizedBox(height: EdSpacing.md),
                      EdPanel(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            const Text(
                              'Profil, journaux, progression d\'exobiologie et '
                              'suivi de lecture des guides sont stockés '
                              'uniquement sur cet appareil.',
                              style: EdTypography.bodySmall,
                            ),
                            const SizedBox(height: EdSpacing.md),
                            OutlinedButton.icon(
                              onPressed: state.isResetting
                                  ? null
                                  : () => _confirmReset(context),
                              icon: const Icon(
                                Icons.delete_outline,
                                size: 16,
                                color: EdColors.redBright,
                              ),
                              label: const Text('Effacer les données locales'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: EdSpacing.xxl),
                      const EdSectionHeader(title: 'À propos', number: 5),
                      const SizedBox(height: EdSpacing.md),
                      const _AboutPanel(),
                      const SizedBox(height: EdSpacing.xxxl),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _confirmReset(BuildContext context) async {
    final SettingsBloc bloc = context.read<SettingsBloc>();
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) => AlertDialog(
        title: const Text('Effacer les données locales ?'),
        content: const Text(
          'Ton profil manuel, tes journaux importés, ta progression '
          'd\'exobiologie et ton suivi de lecture seront supprimés. '
          'Cette action est irréversible et rien n\'est sauvegardé ailleurs.',
          style: EdTypography.bodySmall,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Annuler'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Effacer'),
          ),
        ],
      ),
    );
    if (confirmed ?? false) {
      bloc.add(const SettingsLocalDataResetRequested());
    }
  }
}

class _AboutPanel extends StatelessWidget {
  const _AboutPanel();

  @override
  Widget build(BuildContext context) {
    return const EdPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '${AppIdentity.name} ${AppIdentity.version}',
            style: EdTypography.titleMedium,
          ),
          SizedBox(height: EdSpacing.xs),
          Text(
            'Aucun serveur : l\'application ne communique qu\'avec la '
            'Companion API de Frontier, et seulement quand tu le demandes. '
            'Tout le reste est embarqué ou stocké sur cet appareil.',
            style: EdTypography.bodySmall,
          ),
          SizedBox(height: EdSpacing.md),
          EdSubHeader('Sources des données'),
          SizedBox(height: EdSpacing.xs),
          Text(
            'Canonn Research · Elite Dangerous Wiki (Fandom) · INARA · EDSM · '
            'Spansh · SrvSurvey · notes de mise à jour Frontier Developments.',
            style: EdTypography.caption,
          ),
        ],
      ),
    );
  }
}
