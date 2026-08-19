import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/responsive/adaptive.dart';
import '../../../../core/responsive/window_size.dart';
import '../../../../design_system/design_system.dart';
import '../../../exobiology/domain/entities/engineer.dart';
import '../../../exobiology/domain/entities/suit.dart';
import '../../../exobiology/domain/services/exobiology_reference_data.dart';
import '../../domain/entities/manual_commander_overrides.dart';
import '../../domain/entities/rank.dart';
import '../bloc/commander_bloc.dart';

/// Where the commander tells the app what the Companion API cannot see.
///
/// This page is not a convenience: engineer unlocks, suit modifications and the
/// Meta-Alloy in the hold are simply absent from every API, and the roadmap is
/// only as good as what it knows. It is also what makes the app fully usable
/// without a Frontier account at all.
class ManualProfilePage extends StatelessWidget {
  const ManualProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CommanderBloc>(
      create: (_) => getIt<CommanderBloc>()..add(const CommanderWatchStarted()),
      child: const _ManualProfileView(),
    );
  }
}

class _ManualProfileView extends StatelessWidget {
  const _ManualProfileView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommanderBloc, CommanderState>(
      builder: (BuildContext context, CommanderState state) {
        return switch (state) {
          CommanderReady(:final ManualCommanderOverrides overrides) =>
            _ManualProfileForm(initial: overrides),
          CommanderError(:final failure) =>
            EdErrorView(message: failure.message),
          _ => const EdLoadingView(),
        };
      },
    );
  }
}

class _ManualProfileForm extends StatefulWidget {
  const _ManualProfileForm({required this.initial});

  final ManualCommanderOverrides initial;

  @override
  State<_ManualProfileForm> createState() => _ManualProfileFormState();
}

class _ManualProfileFormState extends State<_ManualProfileForm> {
  late ManualCommanderOverrides _draft = widget.initial;
  late final TextEditingController _nameController =
      TextEditingController(text: _draft.commanderName ?? '');
  late final TextEditingController _systemController =
      TextEditingController(text: _draft.currentSystem ?? '');
  late final TextEditingController _shipController =
      TextEditingController(text: _draft.shipName ?? '');
  late final TextEditingController _creditsController = TextEditingController(
    text: _draft.creditBalance?.toString() ?? '',
  );
  late final TextEditingController _profitController = TextEditingController(
    text: _draft.declaredExobiologyProfitCr?.toString() ?? '',
  );
  late final TextEditingController _rangeController = TextEditingController(
    text: _draft.jumpRangeLy?.toString() ?? '',
  );
  late final Map<String, TextEditingController> _materialControllers =
      <String, TextEditingController>{
    for (final String material in _materials)
      material: TextEditingController(
        text: (_draft.suitMaterials[material] ?? 0) == 0
            ? ''
            : _draft.suitMaterials[material].toString(),
      ),
  };

  static const List<String> _materials = <String>[
    'Suit Schematic',
    'Health Monitor',
    'Manufacturing Instructions',
    'Aerogel',
    'Graphene',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _systemController.dispose();
    _shipController.dispose();
    _creditsController.dispose();
    _profitController.dispose();
    _rangeController.dispose();
    for (final TextEditingController controller
        in _materialControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _update(ManualCommanderOverrides Function() build) =>
      setState(() => _draft = build());

  void _save() {
    final ManualCommanderOverrides saved = ManualCommanderOverrides(
      commanderName: _text(_nameController),
      currentSystem: _text(_systemController),
      shipName: _text(_shipController),
      creditBalance: _int(_creditsController),
      declaredExobiologyProfitCr: _int(_profitController),
      jumpRangeLy: _double(_rangeController),
      explorerRankLevel: _draft.explorerRankLevel,
      artemisGrade: _draft.artemisGrade,
      ownsMaverick: _draft.ownsMaverick,
      installedModIds: _draft.installedModIds,
      unlockedSuitEngineerIds: _draft.unlockedSuitEngineerIds,
      unlockedShipEngineerIds: _draft.unlockedShipEngineerIds,
      suitMaterials: <String, int>{
        for (final MapEntry<String, TextEditingController> entry
            in _materialControllers.entries)
          if (_int(entry.value) case final int quantity) entry.key: quantity,
      },
      hasMetaAlloy: _draft.hasMetaAlloy,
      hasFsdIncreasedRangeG5: _draft.hasFsdIncreasedRangeG5,
      hasMassManager: _draft.hasMassManager,
      hasGuardianFsdBooster: _draft.hasGuardianFsdBooster,
      hasDetailedSurfaceScanner: _draft.hasDetailedSurfaceScanner,
      pledgedPower: _draft.pledgedPower,
    );

    context.read<CommanderBloc>().add(CommanderOverridesSubmitted(saved));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profil enregistré. La feuille de route est à jour.'),
      ),
    );
  }

  static String? _text(TextEditingController c) =>
      c.text.trim().isEmpty ? null : c.text.trim();

  static int? _int(TextEditingController c) =>
      int.tryParse(c.text.replaceAll(RegExp(r'[\s.]'), ''));

  static double? _double(TextEditingController c) =>
      double.tryParse(c.text.replaceAll(',', '.'));

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverToBoxAdapter(
          child: EdPageHeader(
            kicker: 'Saisie manuelle',
            title: 'Mon profil',
            deck: 'Ce que la Companion API n\'expose pas : le grade de ta '
                'combinaison, tes ingénieurs débloqués, tes matériaux. '
                'Chaque champ rempli affine la feuille de route.',
          ),
        ),
        SliverToBoxAdapter(
          child: ReadableWidth(
            maxWidth: Breakpoints.contentColumn,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: EdSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const EdCallout(
                    tone: EdCalloutTone.info,
                    title: 'Ta parole fait foi',
                    child: Text(
                      'Ce que tu déclares ici prime sur ce que renvoie '
                      'Frontier : l\'application ne voit qu\'une partie de ta '
                      'sauvegarde. Laisser un champ vide signifie « je ne me '
                      'prononce pas », pas « je n\'ai rien ».',
                      style: EdTypography.bodySmall,
                    ),
                  ),
                  const SizedBox(height: EdSpacing.xxl),
                  const EdSectionHeader(title: 'Identité', number: 1),
                  const SizedBox(height: EdSpacing.md),
                  EdPanel(
                    child: Column(
                      children: <Widget>[
                        _field(_nameController, 'Nom du commandant'),
                        const SizedBox(height: EdSpacing.sm),
                        _field(_systemController, 'Système actuel'),
                        const SizedBox(height: EdSpacing.sm),
                        _field(_shipController, 'Vaisseau'),
                        const SizedBox(height: EdSpacing.sm),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: _field(
                                _creditsController,
                                'Solde (Cr)',
                                numeric: true,
                              ),
                            ),
                            const SizedBox(width: EdSpacing.sm),
                            Expanded(
                              child: _field(
                                _rangeController,
                                'Portée de saut (LY)',
                                numeric: true,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: EdSpacing.md),
                        _explorerRankPicker(),
                      ],
                    ),
                  ),
                  const SizedBox(height: EdSpacing.xxl),
                  const EdSectionHeader(title: 'Combinaison', number: 2),
                  const SizedBox(height: EdSpacing.md),
                  _suitPanel(),
                  const SizedBox(height: EdSpacing.xxl),
                  const EdSectionHeader(title: 'Matériaux à pied', number: 3),
                  const SizedBox(height: EdSpacing.md),
                  _materialsPanel(),
                  const SizedBox(height: EdSpacing.xxl),
                  const EdSectionHeader(title: 'Ingénieurs', number: 4),
                  const SizedBox(height: EdSpacing.md),
                  _engineersPanel(),
                  const SizedBox(height: EdSpacing.xxl),
                  const EdSectionHeader(title: 'Vaisseau & économie', number: 5),
                  const SizedBox(height: EdSpacing.md),
                  _shipPanel(),
                  const SizedBox(height: EdSpacing.xxl),
                  FilledButton.icon(
                    onPressed: _save,
                    icon: const Icon(Icons.save_outlined, size: 16),
                    label: const Text('Enregistrer'),
                  ),
                  const SizedBox(height: EdSpacing.xxxl),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _field(
    TextEditingController controller,
    String label, {
    bool numeric = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: numeric ? TextInputType.number : TextInputType.text,
      inputFormatters: numeric
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.,\s]')),
            ]
          : null,
      style: numeric
          ? EdTypography.numeric.copyWith(color: EdColors.textStrong)
          : EdTypography.bodySmall,
      decoration: InputDecoration(labelText: label.toUpperCase()),
    );
  }

  Widget _explorerRankPicker() {
    return DropdownButtonFormField<int>(
      initialValue: _draft.explorerRankLevel,
      isExpanded: true,
      decoration: const InputDecoration(labelText: 'RANG EXPLORER'),
      style: EdTypography.bodySmall,
      dropdownColor: EdColors.panelHeader,
      items: <DropdownMenuItem<int>>[
        for (int i = 0; i < RankType.explore.names.length; i++)
          DropdownMenuItem<int>(
            value: i,
            child: Text(
              '$i — ${RankType.explore.names[i]}'
              '${i == 2 ? '  (prérequis Farseer)' : ''}',
              style: EdTypography.bodySmall,
            ),
          ),
      ],
      onChanged: (int? value) =>
          _update(() => _draft.copyWith(explorerRankLevel: value)),
    );
  }

  Widget _suitPanel() {
    final int grade = _draft.artemisGrade ?? 0;
    return EdPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('Grade de l\'Artemis'.toUpperCase(),
              style: EdTypography.overline),
          const SizedBox(height: EdSpacing.xs),
          SegmentedButton<int>(
            segments: const <ButtonSegment<int>>[
              ButtonSegment<int>(value: 0, label: Text('Aucune')),
              ButtonSegment<int>(value: 1, label: Text('1')),
              ButtonSegment<int>(value: 2, label: Text('2')),
              ButtonSegment<int>(value: 3, label: Text('3')),
              ButtonSegment<int>(value: 4, label: Text('4')),
              ButtonSegment<int>(value: 5, label: Text('5')),
            ],
            selected: <int>{grade},
            showSelectedIcon: false,
            onSelectionChanged: (Set<int> values) =>
                _update(() => _draft.copyWith(artemisGrade: values.first)),
          ),
          if (grade == 1) ...<Widget>[
            const SizedBox(height: EdSpacing.sm),
            EdCallout.text(
              tone: EdCalloutTone.warning,
              text: 'Une combinaison grade 1 n\'a aucun emplacement de mod. '
                  'Le grade 2 est le vrai déblocage.',
            ),
          ],
          const SizedBox(height: EdSpacing.md),
          SwitchListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            value: _draft.ownsMaverick,
            onChanged: (bool value) =>
                _update(() => _draft.copyWith(ownsMaverick: value)),
            title: const Text(
              'Je possède une Maverick (Arc Cutter)',
              style: EdTypography.bodySmall,
            ),
          ),
          const Divider(),
          Text('Modifications installées'.toUpperCase(),
              style: EdTypography.overline),
          const SizedBox(height: EdSpacing.xs),
          for (final SuitModification mod
              in ExobiologyReferenceData.suitModifications)
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              controlAffinity: ListTileControlAffinity.leading,
              value: _draft.installedModIds.contains(mod.id),
              onChanged: (bool? value) => _update(
                () => _draft.copyWith(
                  installedModIds: _toggle(_draft.installedModIds, mod.id,
                      value ?? false),
                ),
              ),
              title: Text(mod.name, style: EdTypography.bodySmall),
              subtitle: Text(mod.effect, style: EdTypography.caption),
            ),
        ],
      ),
    );
  }

  Widget _materialsPanel() {
    return EdPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text(
            'Quantités détenues, pour calculer ce qu\'il te manque.',
            style: EdTypography.caption,
          ),
          const SizedBox(height: EdSpacing.md),
          for (final String material in _materials)
            Padding(
              padding: const EdgeInsets.only(bottom: EdSpacing.sm),
              child: _field(
                _materialControllers[material]!,
                material,
                numeric: true,
              ),
            ),
        ],
      ),
    );
  }

  Widget _engineersPanel() {
    final List<Engineer> suitEngineers = ExobiologyReferenceData.engineers
        .where((Engineer e) => e.kind == EngineerKind.suit)
        .toList();
    final List<Engineer> shipEngineers = ExobiologyReferenceData.engineers
        .where((Engineer e) => e.kind == EngineerKind.ship)
        .toList();

    return EdPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const EdSubHeader('Ingénieurs à pied'),
          for (final Engineer engineer in suitEngineers)
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              controlAffinity: ListTileControlAffinity.leading,
              value: _draft.unlockedSuitEngineerIds.contains(engineer.id),
              onChanged: (bool? value) => _update(
                () => _draft.copyWith(
                  unlockedSuitEngineerIds: _toggle(
                    _draft.unlockedSuitEngineerIds,
                    engineer.id,
                    value ?? false,
                  ),
                ),
              ),
              title: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '${engineer.name} · ${engineer.system}',
                      style: EdTypography.bodySmall,
                    ),
                  ),
                  if (engineer.requiresCombat)
                    const EdTag(
                      label: 'Combat',
                      background: EdColors.warnFill,
                      foreground: EdColors.redBright,
                      tooltip: 'Ce déblocage exige du combat au sol',
                    ),
                ],
              ),
            ),
          const Divider(),
          const EdSubHeader('Ingénieurs de vaisseau'),
          for (final Engineer engineer in shipEngineers)
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              controlAffinity: ListTileControlAffinity.leading,
              value: _draft.unlockedShipEngineerIds.contains(engineer.id),
              onChanged: (bool? value) => _update(
                () => _draft.copyWith(
                  unlockedShipEngineerIds: _toggle(
                    _draft.unlockedShipEngineerIds,
                    engineer.id,
                    value ?? false,
                  ),
                ),
              ),
              title: Text(
                '${engineer.name} · ${engineer.system}',
                style: EdTypography.bodySmall,
              ),
            ),
        ],
      ),
    );
  }

  Widget _shipPanel() {
    return EdPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _switch(
            'Detailed Surface Scanner monté',
            _draft.hasDetailedSurfaceScanner,
            (bool v) =>
                _draft.copyWith(hasDetailedSurfaceScanner: v),
          ),
          _switch(
            'FSD Increased Range G5',
            _draft.hasFsdIncreasedRangeG5,
            (bool v) => _draft.copyWith(hasFsdIncreasedRangeG5: v),
          ),
          _switch(
            'Effet expérimental Mass Manager',
            _draft.hasMassManager,
            (bool v) => _draft.copyWith(hasMassManager: v),
          ),
          _switch(
            'Guardian FSD Booster débloqué',
            _draft.hasGuardianFsdBooster,
            (bool v) => _draft.copyWith(hasGuardianFsdBooster: v),
          ),
          _switch(
            'Meta-Alloy en soute',
            _draft.hasMetaAlloy,
            (bool v) => _draft.copyWith(hasMetaAlloy: v),
          ),
          const Divider(),
          SwitchListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            value: _draft.pledgedPower == 'Pranav Antal',
            onChanged: (bool value) => _update(
              () => value
                  ? _draft.copyWith(pledgedPower: 'Pranav Antal')
                  : _draft.copyWith(clearPledgedPower: true),
            ),
            title: const Text(
              'Engagé auprès de Pranav Antal (+30 % exobio)',
              style: EdTypography.bodySmall,
            ),
          ),
          const SizedBox(height: EdSpacing.sm),
          _field(
            _profitController,
            'Profit exobiologie déjà réalisé (Cr)',
            numeric: true,
          ),
          const SizedBox(height: EdSpacing.xs),
          const Text(
            'Ce que tu as déjà gagné avant d\'utiliser l\'application, pour '
            'que la barre de rang Exobiologist parte du bon endroit.',
            style: EdTypography.caption,
          ),
        ],
      ),
    );
  }

  Widget _switch(
    String label,
    bool value,
    ManualCommanderOverrides Function(bool value) build,
  ) {
    return SwitchListTile.adaptive(
      contentPadding: EdgeInsets.zero,
      value: value,
      onChanged: (bool next) => _update(() => build(next)),
      title: Text(label, style: EdTypography.bodySmall),
    );
  }

  static Set<String> _toggle(Set<String> source, String id, bool enabled) {
    final Set<String> next = <String>{...source};
    if (enabled) {
      next.add(id);
    } else {
      next.remove(id);
    }
    return next;
  }
}
