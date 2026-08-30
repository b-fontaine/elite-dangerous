import 'package:flutter/material.dart';

import '../../../../design_system/design_system.dart';
import 'field_dashboard_page.dart';
import 'roadmap_page.dart';
import 'species_catalog_page.dart';
import 'species_finder_page.dart';

/// The tabs, named so no caller has to spell out an index.
abstract final class ExobiologyTab {
  static const int field = 0;
  static const int roadmap = 1;
  static const int finder = 2;
  static const int species = 3;

  static const int count = 4;
}

/// The four faces of the exobiology guide: what is happening right now, the
/// plan, the field tool, and the reference table.
///
/// The dashboard leads because it is the only one that answers a question
/// asked mid-flight. The other three are read before leaving, or afterwards.
class ExobiologyHomePage extends StatefulWidget {
  const ExobiologyHomePage({this.initialTab = ExobiologyTab.field, super.key});

  /// Which face the guide opens on — the router picks it from the URL.
  final int initialTab;

  @override
  State<ExobiologyHomePage> createState() => _ExobiologyHomePageState();
}

class _ExobiologyHomePageState extends State<ExobiologyHomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _controller = TabController(
    length: ExobiologyTab.count,
    vsync: this,
    initialIndex: widget.initialTab.clamp(0, ExobiologyTab.count - 1),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DecoratedBox(
          decoration: const BoxDecoration(
            color: EdColors.panel,
            border: Border(bottom: BorderSide(color: EdColors.border)),
          ),
          child: TabBar(
            controller: _controller,
            indicatorColor: EdColors.orange,
            indicatorWeight: 2,
            dividerColor: Colors.transparent,
            labelColor: EdColors.orangeBright,
            unselectedLabelColor: EdColors.textFainter,
            labelStyle: EdTypography.overline.copyWith(
              color: EdColors.orangeBright,
            ),
            unselectedLabelStyle: EdTypography.overline,
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            tabs: const <Tab>[
              Tab(
                icon: Icon(Icons.radar, size: 18),
                text: 'Terrain',
              ),
              Tab(icon: Icon(Icons.route_outlined, size: 18), text: 'Plan'),
              Tab(
                icon: Icon(Icons.travel_explore, size: 18),
                text: 'Identifier',
              ),
              Tab(icon: Icon(Icons.biotech_outlined, size: 18), text: 'Espèces'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: const <Widget>[
              FieldDashboardPage(),
              RoadmapPage(),
              SpeciesFinderPage(),
              SpeciesCatalogPage(),
            ],
          ),
        ),
      ],
    );
  }
}
