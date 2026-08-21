/// Turns the game's codex tokens into the names it prints on screen.
///
/// The dump only ever names a genus by its token — `$Codex_Ent_Stratum_Genus_Name;`
/// — and six of the twenty-one correspondences cannot be derived from the
/// token at all: `Sphere` is Anemone, `Cone` is Bark Mound, `Brancae` is Brain
/// Tree, `Vents` is Amphora Plant, `Tube` is Sinuous Tubers,
/// `Ground_Struct_Ice` is Crystalline Shards. Several of the ordinary ones are
/// no better: `Shrubs` is Frutexa, `Cactoid` is Cactoida, `Fonticulus` is
/// Fonticulua.
///
/// So this is a table, not an algorithm. The fallback below exists only so an
/// unknown token degrades into something readable instead of into `null` —
/// which is not hypothetical: Radicoida is in the game and is absent from
/// Spansh's enum.
abstract final class CodexNames {
  /// Genus tokens, as they appear in `signals.genuses`.
  ///
  /// The names on the right are the ones the bundled catalogue uses, so a
  /// decoded genus joins straight onto `ExobiologyCatalog`.
  static const Map<String, String> genera = <String, String>{
    r'$Codex_Ent_Aleoids_Genus_Name;': 'Aleoida',
    r'$Codex_Ent_Bacterial_Genus_Name;': 'Bacterium',
    r'$Codex_Ent_Brancae_Name;': 'Brain Tree',
    r'$Codex_Ent_Cactoid_Genus_Name;': 'Cactoida',
    r'$Codex_Ent_Clypeus_Genus_Name;': 'Clypeus',
    r'$Codex_Ent_Conchas_Genus_Name;': 'Concha',
    r'$Codex_Ent_Cone_Name;': 'Bark Mound',
    r'$Codex_Ent_Electricae_Genus_Name;': 'Electricae',
    r'$Codex_Ent_Fonticulus_Genus_Name;': 'Fonticulua',
    r'$Codex_Ent_Fumerolas_Genus_Name;': 'Fumerola',
    r'$Codex_Ent_Fungoids_Genus_Name;': 'Fungoida',
    r'$Codex_Ent_Ground_Struct_Ice_Name;': 'Crystalline Shard',
    r'$Codex_Ent_Ingensradices_Genus_Name;': 'Radicoida',
    r'$Codex_Ent_Osseus_Genus_Name;': 'Osseus',
    r'$Codex_Ent_Recepta_Genus_Name;': 'Recepta',
    r'$Codex_Ent_Shrubs_Genus_Name;': 'Frutexa',
    r'$Codex_Ent_Sphere_Name;': 'Anemone',
    r'$Codex_Ent_Stratum_Genus_Name;': 'Stratum',
    r'$Codex_Ent_Tube_Name;': 'Sinuous Tuber',
    r'$Codex_Ent_Tubus_Genus_Name;': 'Tubus',
    r'$Codex_Ent_Tussocks_Genus_Name;': 'Tussock',
    r'$Codex_Ent_Vents_Name;': 'Amphora Plant',
  };

  /// The signal type that matters here. The others — `Geological`, `Human`,
  /// `Thargoid`, `Guardian`, `Other` — share the shape and not the interest.
  static const String biologicalSignal = r'$SAA_SignalType_Biological;';

  /// The genus name for [token], or a readable guess when the token is one
  /// this table has never seen.
  static String genus(String token) => genera[token] ?? _guess(token);

  /// Strips the scaffolding off an unknown token: `$Codex_Ent_Foo_Genus_Name;`
  /// becomes `Foo`. Wrong as often as not — that is why the table exists — but
  /// it beats showing a commander a raw symbol.
  static String _guess(String token) {
    String name = token;
    if (name.startsWith(r'$')) {
      name = name.substring(1);
    }
    if (name.endsWith(';')) {
      name = name.substring(0, name.length - 1);
    }
    for (final String affix in <String>[
      'Codex_Ent_',
      '_Genus_Name',
      '_Name',
    ]) {
      name = name.replaceFirst(affix, '');
    }
    return name.replaceAll('_', ' ').trim();
  }
}
