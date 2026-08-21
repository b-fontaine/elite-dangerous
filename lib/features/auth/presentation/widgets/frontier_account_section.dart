import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../design_system/design_system.dart';
import '../../domain/entities/auth_status.dart';
import '../bloc/auth_bloc.dart';
import 'auth_status_banner.dart';

/// The Frontier account block of the settings screen.
///
/// « Connecter » starts the OAuth flow right here. The client id is already
/// known — compiled into the build or saved on this device — so routing the
/// commander through a configuration screen first was both a detour and a way
/// of putting a value they never typed in front of them. Changing that value
/// stays possible, one deliberate button further away.
///
/// Requires an [AuthBloc] above it.
class FrontierAccountSection extends StatelessWidget {
  const FrontierAccountSection({this.onConfigure, super.key});

  /// Opens the client configuration screen. Null hides the entry point.
  final VoidCallback? onConfigure;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        if (state is! AuthReady) {
          return const EdLoadingView();
        }

        // With no client id there is nothing to authorise: Frontier would
        // reject the request, so the only useful action is to go and set one.
        final bool canSignIn = state.status is! AuthUnconfigured;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AuthStatusBanner(
              status: state.status,
              isConnecting: state.isSigningIn,
              onConnect: canSignIn
                  ? () => context
                      .read<AuthBloc>()
                      .add(const AuthSignInRequested())
                  : null,
              onDisconnect: () =>
                  context.read<AuthBloc>().add(const AuthSignOutRequested()),
            ),
            if (state.failure != null) ...<Widget>[
              const SizedBox(height: EdSpacing.md),
              EdCallout.text(
                tone: EdCalloutTone.warning,
                title: 'Connexion impossible',
                text: state.failure!.message,
              ),
            ],
            if (onConfigure != null) ...<Widget>[
              const SizedBox(height: EdSpacing.md),
              Align(
                alignment: Alignment.centerLeft,
                child: OutlinedButton.icon(
                  onPressed: onConfigure,
                  icon: const Icon(Icons.key_outlined, size: 16),
                  label: const Text('Configurer l\'authentification'),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
