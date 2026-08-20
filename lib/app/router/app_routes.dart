import 'package:flutter/widgets.dart';

/// Every route path in one place, so no widget hard-codes a string.
abstract final class AppRoutes {
  static const String dashboard = '/';
  static const String commander = '/commandant';
  static const String commanderManual = '/commandant/saisie';

  /// The cockpit's five detail pages.
  static const String career = '/carriere';
  static const String fleet = '/flotte';
  static const String onFoot = '/a-pied';
  static const String engineers = '/ingenieurs';
  static const String materials = '/materiaux';
  static String materialBlueprint(String id) => '/materiaux/$id';
  static const String station = '/station';

  static const String exobiology = '/exobiologie';
  static const String exobiologyRoadmap = '/exobiologie';
  static const String exobiologySpecies = '/exobiologie/especes';
  static const String exobiologyFinder = '/exobiologie/identifier';

  static const String journal = '/journal';

  static const String guides = '/guides';
  static String guideDetail(String id) => '/guides/$id';

  static const String settings = '/reglages';
  static const String frontierConnection = '/reglages/frontier';
  static const String diagnostics = '/reglages/diagnostic';
}

/// A top-level destination of the adaptive navigation.
class AppDestination {
  const AppDestination({
    required this.path,
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.shortLabel,
  });

  final String path;
  final String label;

  /// Used by the bottom bar, where horizontal room is scarce.
  final String shortLabel;

  final IconData icon;
  final IconData selectedIcon;
}
