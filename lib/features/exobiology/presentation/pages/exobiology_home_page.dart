import 'package:flutter/material.dart';

import '../../../../design_system/design_system.dart';
import 'roadmap_page.dart';
import 'species_catalog_page.dart';
import 'species_finder_page.dart';

/// The three faces of the exobiology guide: the plan, the field tool, and the
/// reference table.
class ExobiologyHomePage extends StatefulWidget {
  const ExobiologyHomePage({this.initialTab = 0, super.key});

  final int initialTab;

  @override
  State<ExobiologyHomePage> createState() => _ExobiologyHomePageState();
}

class _ExobiologyHomePageState extends State<ExobiologyHomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _controller = TabController(
    length: 3,
    vsync: this,
    initialIndex: widget.initialTab.clamp(0, 2),
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
            tabs: const <Tab>[
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
