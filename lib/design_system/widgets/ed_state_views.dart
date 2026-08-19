import 'package:flutter/material.dart';

import '../tokens/ed_colors.dart';
import '../tokens/ed_spacing.dart';
import '../tokens/ed_typography.dart';

/// Indeterminate loading state with a HUD-flavoured label.
class EdLoadingView extends StatelessWidget {
  const EdLoadingView({this.message = 'Analyse en cours…', super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(
            width: 26,
            height: 26,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          const SizedBox(height: EdSpacing.md),
          Text(message.toUpperCase(), style: EdTypography.overline),
        ],
      ),
    );
  }
}

/// Error state with an optional retry affordance.
class EdErrorView extends StatelessWidget {
  const EdErrorView({
    required this.message,
    this.title = 'Anomalie',
    this.onRetry,
    this.retryLabel = 'Réessayer',
    super.key,
  });

  final String message;
  final String title;
  final VoidCallback? onRetry;
  final String retryLabel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(EdSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(Icons.error_outline_rounded,
                size: 34, color: EdColors.redBright),
            const SizedBox(height: EdSpacing.sm),
            Text(
              title.toUpperCase(),
              style: EdTypography.overline.copyWith(color: EdColors.redBright),
            ),
            const SizedBox(height: EdSpacing.xs),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 460),
              child: Text(
                message,
                style: EdTypography.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),
            if (onRetry != null) ...<Widget>[
              const SizedBox(height: EdSpacing.lg),
              OutlinedButton(onPressed: onRetry, child: Text(retryLabel)),
            ],
          ],
        ),
      ),
    );
  }
}

/// Empty state used when a list has nothing to show yet.
class EdEmptyView extends StatelessWidget {
  const EdEmptyView({
    required this.message,
    this.title = 'Rien à afficher',
    this.icon = Icons.satellite_alt_outlined,
    this.action,
    super.key,
  });

  final String message;
  final String title;
  final IconData icon;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(EdSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, size: 34, color: EdColors.textFainter),
            const SizedBox(height: EdSpacing.sm),
            Text(title.toUpperCase(), style: EdTypography.overline),
            const SizedBox(height: EdSpacing.xs),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 460),
              child: Text(
                message,
                style: EdTypography.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),
            if (action != null) ...<Widget>[
              const SizedBox(height: EdSpacing.lg),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
