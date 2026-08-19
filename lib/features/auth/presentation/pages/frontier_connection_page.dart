import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/responsive/adaptive.dart';
import '../../../../design_system/design_system.dart';
import '../../data/datasources/redirect_listener_factory.dart';
import '../../domain/entities/oauth_client_config.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/auth_status_banner.dart';

/// Tells the commander that a client id compiled into this build is already in
/// use, that it is deliberately hidden, and how to take it over.
///
/// Returns null when there is nothing to explain: a value they entered
/// themselves, or no value at all.
String? clientIdHelperText(OAuthClientConfig config) =>
    config.clientIdIsBuildDefault
        ? 'Ce build embarque déjà un client_id, masqué ici. Une saisie le '
            'remplace sur cet appareil ; laisser le champ vide le conserve.'
        : null;

/// What the client id field starts with.
///
/// A value that comes from the build is deliberately left out: it was never
/// typed on this device, and putting it on screen — in a field, in a
/// screenshot, over a shoulder — hands it out for nothing. An empty submission
/// already means « keep the build default », so nothing is lost. A value the
/// commander saved themselves does come back, so a typo can be corrected
/// instead of retyped.
String initialClientIdFieldValue(OAuthClientConfig config) =>
    config.clientIdIsBuildDefault ? '' : config.clientId;

/// Connecting a Frontier account — and being honest about what that costs.
class FrontierConnectionPage extends StatelessWidget {
  const FrontierConnectionPage({this.onContinueWithoutAccount, super.key});

  final VoidCallback? onContinueWithoutAccount;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => getIt<AuthBloc>()..add(const AuthWatchStarted()),
      child: _ConnectionView(
        onContinueWithoutAccount: onContinueWithoutAccount,
      ),
    );
  }
}

class _ConnectionView extends StatelessWidget {
  const _ConnectionView({this.onContinueWithoutAccount});

  final VoidCallback? onContinueWithoutAccount;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        if (state is! AuthReady) {
          return const EdLoadingView();
        }
        return CustomScrollView(
          slivers: <Widget>[
            const SliverToBoxAdapter(
              child: EdPageHeader(
                kicker: 'Companion API',
                title: 'Authentification',
                deck: 'Le client OAuth avec lequel l\'application se présente '
                    'à Frontier. Une fois configuré, la connexion se lance '
                    'depuis Réglages.',
              ),
            ),
            SliverToBoxAdapter(
              child: ReadableWidth(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: EdSpacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      AuthStatusBanner(
                        status: state.status,
                        onDisconnect: () => context
                            .read<AuthBloc>()
                            .add(const AuthSignOutRequested()),
                      ),
                      if (state.failure != null) ...<Widget>[
                        const SizedBox(height: EdSpacing.md),
                        EdCallout.text(
                          tone: EdCalloutTone.warning,
                          title: 'Connexion impossible',
                          text: state.failure!.message,
                        ),
                      ],
                      const SizedBox(height: EdSpacing.xxl),
                      const EdSectionHeader(
                        title: 'Obtenir un client_id',
                        number: 1,
                      ),
                      const SizedBox(height: EdSpacing.md),
                      const EdCallout(
                        tone: EdCalloutTone.info,
                        title: 'Pourquoi c\'est à toi de le faire',
                        child: Text(
                          'Frontier ne délivre un identifiant d\'application '
                          'qu\'après une demande examinée par un humain : il '
                          'n\'existe aucune inscription automatique. Cette '
                          'application ne peut donc pas en embarquer un, et '
                          'elle refuse d\'emprunter celui d\'un autre outil — '
                          'elle apparaîtrait sous le nom de cet outil dans la '
                          'liste de tes applications autorisées.',
                          style: EdTypography.bodySmall,
                        ),
                      ),
                      const SizedBox(height: EdSpacing.md),
                      const EdSteps(
                        steps: <EdStep>[
                          EdStep(
                            text: 'Ouvre user.frontierstore.net et demande '
                                'l\'accès développeur',
                            detail: 'La validation n\'est pas instantanée.',
                          ),
                          EdStep(
                            text: 'Une fois approuvé, ouvre la « Developer '
                                'Zone » et clique sur « View »',
                            detail: 'Tu devrais avoir les portées AUTH et CAPI.',
                          ),
                          EdStep(
                            text: 'Copie le Client ID ci-dessous',
                            detail: 'La « Shared Key » n\'est pas nécessaire : '
                                'l\'application utilise PKCE. Ne la saisis '
                                'nulle part.',
                          ),
                        ],
                      ),
                      const SizedBox(height: EdSpacing.xxl),
                      const EdSectionHeader(
                        title: 'Configurer',
                        number: 2,
                      ),
                      const SizedBox(height: EdSpacing.md),
                      _ClientConfigForm(config: state.config),
                      const SizedBox(height: EdSpacing.xxl),
                      const EdSectionHeader(
                        title: 'Sans compte Frontier',
                        number: 3,
                      ),
                      const SizedBox(height: EdSpacing.md),
                      const EdCallout(
                        tone: EdCalloutTone.tip,
                        title: 'L\'application reste complète',
                        child: Text(
                          'Le catalogue des espèces, les guides et la feuille '
                          'de route fonctionnent hors ligne. Tu peux importer '
                          'tes fichiers Journal.*.log depuis le dossier de '
                          'sauvegarde du jeu, ou simplement renseigner ton '
                          'profil à la main.',
                          style: EdTypography.bodySmall,
                        ),
                      ),
                      if (onContinueWithoutAccount != null) ...<Widget>[
                        const SizedBox(height: EdSpacing.md),
                        OutlinedButton(
                          onPressed: onContinueWithoutAccount,
                          child: const Text('Continuer sans compte'),
                        ),
                      ],
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
}

class _ClientConfigForm extends StatefulWidget {
  const _ClientConfigForm({required this.config});

  final OAuthClientConfig config;

  @override
  State<_ClientConfigForm> createState() => _ClientConfigFormState();
}

class _ClientConfigFormState extends State<_ClientConfigForm> {
  late final TextEditingController _clientId =
      TextEditingController(text: initialClientIdFieldValue(widget.config));

  late final TextEditingController _redirectUri = TextEditingController(
    text: widget.config.redirectUri.isEmpty
        ? RedirectListenerFactory.mobileRedirectUri
        : widget.config.redirectUri,
  );

  /// A client id is not an OAuth secret, but it is not the commander's to leak
  /// either — and the one this build ships with is never in the controller at
  /// all, so revealing shows only what was typed here.
  bool _obscureClientId = true;

  @override
  void dispose() {
    _clientId.dispose();
    _redirectUri.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthState state = context.watch<AuthBloc>().state;
    final bool isSigningIn = state is AuthReady && state.isSigningIn;

    return EdPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            controller: _clientId,
            obscureText: _obscureClientId,
            autocorrect: false,
            enableSuggestions: false,
            style: EdTypography.bodySmall,
            decoration: InputDecoration(
              labelText: 'CLIENT ID',
              hintText: widget.config.clientIdIsBuildDefault
                  ? 'Client id du build — masqué'
                  : '00000000-0000-0000-0000-000000000000',
              helperText: clientIdHelperText(widget.config),
              helperMaxLines: 3,
              suffixIcon: IconButton(
                onPressed: () => setState(
                  () => _obscureClientId = !_obscureClientId,
                ),
                tooltip: _obscureClientId ? 'Afficher' : 'Masquer',
                icon: Icon(
                  _obscureClientId
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 18,
                ),
              ),
            ),
          ),
          const SizedBox(height: EdSpacing.sm),
          TextField(
            controller: _redirectUri,
            style: EdTypography.bodySmall,
            decoration: const InputDecoration(
              labelText: 'REDIRECT URI (MOBILE)',
              helperText: 'Sur ordinateur, un serveur local est utilisé '
                  'automatiquement.',
              helperMaxLines: 2,
            ),
          ),
          const SizedBox(height: EdSpacing.md),
          Row(
            children: <Widget>[
              Expanded(
                child: OutlinedButton(
                  onPressed: () => context.read<AuthBloc>().add(
                        AuthClientConfigSubmitted(
                          OAuthClientConfig(
                            clientId: _clientId.text.trim(),
                            redirectUri: _redirectUri.text.trim(),
                          ),
                        ),
                      ),
                  child: const Text('Enregistrer'),
                ),
              ),
              const SizedBox(width: EdSpacing.sm),
              Expanded(
                child: FilledButton.icon(
                  onPressed: isSigningIn
                      ? null
                      : () => context
                          .read<AuthBloc>()
                          .add(const AuthSignInRequested()),
                  icon: isSigningIn
                      ? const SizedBox(
                          width: 14,
                          height: 14,
                          child:
                              CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.open_in_browser, size: 16),
                  label: Text(
                    isSigningIn ? 'En attente…' : 'Se connecter',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
