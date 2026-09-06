import 'package:flutter/material.dart';

import '../../../../design_system/design_system.dart';

/// How old a piece of shared state is, as a commander reads it.
///
/// Seconds matter here, unlike everywhere else in this feature: the whole point
/// of the caption is to separate "the PC answered a moment ago" from "the PC
/// answered before dinner", and `formatDuration`'s minute granularity would
/// print `—` for both.
String formatAge(Duration age) {
  if (age.inSeconds < 5) {
    return 'à l\'instant';
  }
  if (age.inSeconds < 60) {
    return 'il y a ${age.inSeconds} s';
  }
  if (age.inMinutes < 60) {
    return 'il y a ${age.inMinutes} min';
  }
  final int hours = age.inHours;
  final int minutes = age.inMinutes.remainder(60);
  return 'il y a $hours h ${minutes.toString().padLeft(2, '0')}';
}

/// Says where a second screen's figures come from, and how old they are.
///
/// **The age, never a "connected" light.** The game only rewrites its files
/// when something changes, so twenty quiet minutes at a station are normal and
/// a green lamp would be a lie. An age is true in both cases and lets the
/// commander decide whether it is stale.
class SharedRouteBanner extends StatelessWidget {
  const SharedRouteBanner({
    required this.host,
    required this.age,
    required this.onRefresh,
    this.isStale = false,
    super.key,
  });

  /// The game machine being read.
  final String host;

  /// How stale the figures were when they were read. Null when the machine
  /// answered but is flying no route.
  final Duration? age;

  final VoidCallback onRefresh;

  /// Whether the last read failed. The figures stay — they were true when they
  /// arrived — and [age] says how long ago that was.
  final bool isStale;

  @override
  Widget build(BuildContext context) {
    final Color accent = isStale ? EdColors.orange : EdColors.cyan;

    return EdPanel(
      accent: accent,
      child: Row(
        children: <Widget>[
          Icon(
            isStale ? Icons.cloud_off_outlined : Icons.devices_outlined,
            size: 18,
            color: accent,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  isStale
                      ? 'Machine de jeu silencieuse'
                      : 'Lu sur la machine de jeu',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(height: 2),
                Text(
                  age == null ? host : '$host · données ${formatAge(age!)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: 'Relire maintenant',
            onPressed: onRefresh,
            icon: const Icon(Icons.refresh, size: 18),
          ),
        ],
      ),
    );
  }
}
