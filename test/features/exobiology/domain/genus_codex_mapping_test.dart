import 'dart:convert';

import 'package:elite_dangerous/features/exobiology/domain/services/exobiology_reference_data.dart';
import 'package:elite_dangerous/features/journal/domain/entities/journal_event.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// The journal names a genus by an internal token; the catalogue names it by
/// the genus the commander reads. The two vocabularies only coincide by
/// accident, so the bridge between them is a table — and a table drifts unless
/// something holds it against both ends.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Set<String> catalogueGenusIds;

  setUpAll(() async {
    final String raw = await rootBundle.loadString(
      'assets/data/exobiology_catalog.json',
    );
    final Map<String, dynamic> catalogue =
        jsonDecode(raw) as Map<String, dynamic>;
    catalogueGenusIds = <String>{
      for (final dynamic genus in catalogue['genera'] as List<dynamic>)
        (genus as Map<String, dynamic>)['id'] as String,
    };
  });

  test('chaque jeton du journal désigne un genre qui existe au catalogue', () {
    // Le sens qui compte à l'exécution : un jeton lu dans un journal doit
    // pouvoir être affiché, valorisé et rapproché des espèces connues.
    final List<String> orphelins = <String>[
      for (final String id in ExobiologyReferenceData.mappedGenusIds)
        if (!catalogueGenusIds.contains(id)) id,
    ];

    expect(orphelins, isEmpty,
        reason: 'genres pointés par la table mais absents du catalogue');
  });

  test('aucun genre du catalogue n\'est inatteignable depuis un journal', () {
    // Le sens inverse : un genre catalogué qu'aucun jeton n'atteint est un
    // genre que le DSS ne pourra jamais confirmer, donc du contenu mort.
    final Set<String> atteignables =
        ExobiologyReferenceData.mappedGenusIds.toSet();
    final List<String> inatteignables = <String>[
      for (final String id in catalogueGenusIds)
        if (!atteignables.contains(id)) id,
    ];

    expect(inatteignables, isEmpty,
        reason: 'genres du catalogue sans jeton de journal correspondant');
  });

  test('la table ne fait pas de doublon', () {
    expect(
      ExobiologyReferenceData.mappedGenusIds.toSet(),
      hasLength(ExobiologyReferenceData.knownGenusCodexTokens.length),
    );
  });

  test('les correspondances contre-intuitives sont bien celles du jeu', () {
    // Les six que tout identifiant dérivé du jeton se trompe : c'est
    // précisément pour elles que la table existe.
    const Map<String, String> pieges = <String, String>{
      r'$Codex_Ent_Shrubs_Genus_Name;': 'frutexa',
      r'$Codex_Ent_Cone_Name;': 'bark_mound',
      r'$Codex_Ent_Sphere_Name;': 'anemone',
      r'$Codex_Ent_Vents_Name;': 'amphora_plant',
      r'$Codex_Ent_Ground_Struct_Ice_Name;': 'crystalline_shard',
      r'$Codex_Ent_Tube_Name;': 'sinuous_tuber',
    };

    pieges.forEach((String token, String expected) {
      expect(ExobiologyReferenceData.genusIdFromCodex(token), expected,
          reason: token);
    });
  });

  test('les pluriels du jeton se résolvent au singulier du catalogue', () {
    expect(
      ExobiologyReferenceData.genusIdFromCodex(
          r'$Codex_Ent_Tussocks_Genus_Name;'),
      'tussock',
    );
    expect(
      ExobiologyReferenceData.genusIdFromCodex(
          r'$Codex_Ent_Bacterial_Genus_Name;'),
      'bacterium',
    );
    expect(
      ExobiologyReferenceData.genusIdFromCodex(
          r'$Codex_Ent_Fungoids_Genus_Name;'),
      'fungoida',
    );
  });

  test('la casse du jeton n\'a pas à être devinée', () {
    expect(
      ExobiologyReferenceData.genusIdFromCodex(
          r'$CODEX_ENT_STRATUM_GENUS_NAME;'),
      'stratum',
    );
  });

  test('un genre que le jeu ajoutera rend null, pas une erreur', () {
    // Frontier a ajouté Radicoida en 2026 et en ajoutera d'autres : ne rien
    // savoir doit rester une réponse, pas une exception.
    expect(
      ExobiologyReferenceData.genusIdFromCodex(r'$Codex_Ent_Inconnu_Name;'),
      isNull,
    );
  });

  test('un genre lu dans un SAASignalsFound se traduit de bout en bout', () {
    const DetectedGenus genus = DetectedGenus(
      symbol: r'$Codex_Ent_Shrubs_Genus_Name;',
      localised: 'Frutexa',
    );

    expect(
      ExobiologyReferenceData.genusIdFromCodex(genus.lookupKey),
      'frutexa',
    );
    expect(genus.displayName, 'Frutexa');
  });
}
