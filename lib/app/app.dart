import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import '../design_system/design_system.dart';
import 'router/app_router.dart';

/// The application root.
class EliteDangerousApp extends StatefulWidget {
  const EliteDangerousApp({super.key});

  @override
  State<EliteDangerousApp> createState() => _EliteDangerousAppState();
}

class _EliteDangerousAppState extends State<EliteDangerousApp> {
  late final GoRouter _router = createAppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Codex Exobiologique',
      debugShowCheckedModeBanner: false,
      // Elite's own HUD is dark-only, and so are the source guides: a light
      // variant would betray the identity rather than serve accessibility.
      theme: EdTheme.build(),
      themeMode: ThemeMode.dark,
      locale: const Locale('fr', 'FR'),
      supportedLocales: const <Locale>[Locale('fr', 'FR'), Locale('en', 'US')],
      localizationsDelegates: const <LocalizationsDelegate<Object>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: _router,
    );
  }
}
