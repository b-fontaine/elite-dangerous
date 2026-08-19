import 'package:flutter/material.dart';

import '../../../../design_system/design_system.dart';
import '../../domain/entities/auth_status.dart';
import '../../domain/entities/frontier_session.dart';

/// Compact, reusable summary of the Frontier connection.
class AuthStatusBanner extends StatelessWidget {
  const AuthStatusBanner({
    required this.status,
    this.onConnect,
    this.onDisconnect,
    super.key,
  });

  final AuthStatus status;
  final VoidCallback? onConnect;
  final VoidCallback? onDisconnect;

  @override
  Widget build(BuildContext context) {
    final (Color accent, IconData icon, String title, String message) =
        switch (status) {
      AuthSignedIn(:final FrontierSession session) => (
          EdColors.greenBright,
          Icons.link,
          'Compte Frontier connecté',
          'Reconnexion nécessaire avant le '
              '${_formatDate(session.reauthorisationDeadline)} — Frontier '
              'limite le rafraîchissement à 25 jours.',
        ),
      AuthReauthorisationRequired() => (
          EdColors.gold,
          Icons.link_off,
          'Reconnexion requise',
          'Les 25 jours accordés par Frontier sont écoulés. Une nouvelle '
              'autorisation dans le navigateur suffit.',
        ),
      AuthUnconfigured() => (
          EdColors.textFainter,
          Icons.key_off_outlined,
          'Aucun client OAuth configuré',
          'Frontier délivre un client_id sur demande, après validation '
              'manuelle. L\'application reste utilisable sans compte.',
        ),
      AuthSignedOut() => (
          EdColors.textFainter,
          Icons.link_off,
          'Non connecté',
          'Connecte ton compte pour récupérer ton profil et tes journaux '
              'de bord.',
        ),
    };

    return EdPanel(
      accent: accent,
      background: EdColors.panelRaised,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, size: 18, color: accent),
          const SizedBox(width: EdSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title.toUpperCase(),
                  style: EdTypography.overline.copyWith(color: accent),
                ),
                const SizedBox(height: 6),
                Text(message, style: EdTypography.bodySmall),
              ],
            ),
          ),
          const SizedBox(width: EdSpacing.sm),
          if (status is AuthSignedIn)
            TextButton(
              onPressed: onDisconnect,
              child: const Text('Déconnecter'),
            )
          else if (onConnect != null)
            OutlinedButton(
              onPressed: onConnect,
              child: const Text('Connecter'),
            ),
        ],
      ),
    );
  }

  static String _formatDate(DateTime date) =>
      '${date.day.toString().padLeft(2, '0')}/'
      '${date.month.toString().padLeft(2, '0')}/${date.year}';
}
