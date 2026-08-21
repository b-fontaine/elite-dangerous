import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/frontier_connection_page.dart';
import '../../features/commander/presentation/pages/commander_page.dart';
import '../../features/commander/presentation/pages/manual_profile_page.dart';
import '../../features/dashboard/presentation/pages/career_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/dashboard/presentation/pages/engineers_page.dart';
import '../../features/dashboard/presentation/pages/fleet_page.dart';
import '../../features/dashboard/presentation/pages/on_foot_page.dart';
import '../../features/dashboard/presentation/pages/station_page.dart';
import '../../features/diagnostics/presentation/pages/diagnostics_page.dart';
import '../../features/exobiology/presentation/pages/exobiology_home_page.dart';
import '../../features/guides/presentation/pages/guide_detail_page.dart';
import '../../features/guides/presentation/pages/guides_page.dart';
import '../../features/journal/presentation/pages/journal_page.dart';
import '../../features/materials/presentation/pages/blueprint_plan_page.dart';
import '../../features/materials/presentation/pages/materials_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../shell/adaptive_shell.dart';
import 'app_routes.dart';

/// The five top-level destinations, in the order they appear in the navigation.
const List<AppDestination> appDestinations = <AppDestination>[
  AppDestination(
    path: AppRoutes.dashboard,
    label: 'Poste de pilotage',
    shortLabel: 'Cockpit',
    icon: Icons.dashboard_outlined,
    selectedIcon: Icons.dashboard,
  ),
  AppDestination(
    path: AppRoutes.exobiology,
    label: 'Exobiologie',
    shortLabel: 'Exobio',
    icon: Icons.biotech_outlined,
    selectedIcon: Icons.biotech,
  ),
  AppDestination(
    path: AppRoutes.journal,
    label: 'Journal de bord',
    shortLabel: 'Journal',
    icon: Icons.menu_book_outlined,
    selectedIcon: Icons.menu_book,
  ),
  AppDestination(
    path: AppRoutes.guides,
    label: 'Guides',
    shortLabel: 'Guides',
    icon: Icons.auto_stories_outlined,
    selectedIcon: Icons.auto_stories,
  ),
  AppDestination(
    path: AppRoutes.settings,
    label: 'Réglages',
    shortLabel: 'Réglages',
    icon: Icons.settings_outlined,
    selectedIcon: Icons.settings,
  ),
];

/// Builds the router.
///
/// A `StatefulShellRoute` keeps one navigation stack per destination, so
/// leaving the guides mid-article and coming back does not reset the scroll —
/// which matters for documents this long.
GoRouter createAppRouter() {
  return GoRouter(
    initialLocation: AppRoutes.dashboard,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return AdaptiveShell(
            destinations: appDestinations,
            selectedIndex: navigationShell.currentIndex,
            onSelect: (int index) => navigationShell.goBranch(
              index,
              // Tapping the active destination pops back to its root.
              initialLocation: index == navigationShell.currentIndex,
            ),
            child: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.dashboard,
                builder: (BuildContext context, GoRouterState state) =>
                    DashboardPage(
                  destinations: CockpitDestinations(
                    onOpenRoadmap: () => context.go(AppRoutes.exobiology),
                    onOpenProfile: () => context.go(AppRoutes.commander),
                    onOpenCareer: () => context.go(AppRoutes.career),
                    onOpenFleet: () => context.go(AppRoutes.fleet),
                    onOpenOnFoot: () => context.go(AppRoutes.onFoot),
                    onOpenEngineers: () => context.go(AppRoutes.engineers),
                    onOpenMaterials: () => context.go(AppRoutes.materials),
                    onOpenStation: () => context.go(AppRoutes.station),
                  ),
                ),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'commandant',
                    builder: (BuildContext context, GoRouterState state) =>
                        CommanderPage(
                      onEditProfile: () =>
                          context.go(AppRoutes.commanderManual),
                    ),
                    routes: <RouteBase>[
                      GoRoute(
                        path: 'saisie',
                        builder: (BuildContext context, GoRouterState state) =>
                            const ManualProfilePage(),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'carriere',
                    builder: (BuildContext context, GoRouterState state) =>
                        const CareerPage(),
                  ),
                  GoRoute(
                    path: 'flotte',
                    builder: (BuildContext context, GoRouterState state) =>
                        const FleetPage(),
                  ),
                  GoRoute(
                    path: 'a-pied',
                    builder: (BuildContext context, GoRouterState state) =>
                        const OnFootPage(),
                  ),
                  GoRoute(
                    path: 'ingenieurs',
                    builder: (BuildContext context, GoRouterState state) =>
                        const EngineersPage(),
                  ),
                  GoRoute(
                    path: 'materiaux',
                    builder: (BuildContext context, GoRouterState state) =>
                        const MaterialsPage(),
                    routes: <RouteBase>[
                      GoRoute(
                        path: ':blueprintId',
                        builder: (BuildContext context, GoRouterState state) =>
                            BlueprintPlanPage(
                          blueprintId:
                              state.pathParameters['blueprintId'] ?? '',
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'station',
                    builder: (BuildContext context, GoRouterState state) =>
                        const StationPage(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.exobiology,
                builder: (BuildContext context, GoRouterState state) =>
                    const ExobiologyHomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.journal,
                builder: (BuildContext context, GoRouterState state) =>
                    const JournalPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.guides,
                builder: (BuildContext context, GoRouterState state) =>
                    const GuidesPage(),
                routes: <RouteBase>[
                  GoRoute(
                    path: ':guideId',
                    builder: (BuildContext context, GoRouterState state) =>
                        GuideDetailPage(
                      guideId: state.pathParameters['guideId'] ?? '',
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.settings,
                builder: (BuildContext context, GoRouterState state) =>
                    SettingsPage(
                  onConfigureAuthentication: () =>
                      context.go(AppRoutes.frontierConnection),
                  onOpenDiagnostics: () => context.go(AppRoutes.diagnostics),
                ),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'frontier',
                    builder: (BuildContext context, GoRouterState state) =>
                        FrontierConnectionPage(
                      onContinueWithoutAccount: () =>
                          context.go(AppRoutes.dashboard),
                    ),
                  ),
                  GoRoute(
                    path: 'diagnostic',
                    builder: (BuildContext context, GoRouterState state) =>
                        const DiagnosticsPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
