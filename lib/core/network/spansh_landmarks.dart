/// Spansh's `landmarks` vocabulary, shared by every endpoint that reports one.
///
/// Two endpoints speak it — `GET /api/body/{id64}`, which the system lookup
/// reads, and the route plotters, which return the same `type` / `subtype`
/// pair per body. Keeping one table means a genus renamed upstream is fixed
/// once rather than in two places that then disagree.
abstract final class SpanshLandmarks {
  /// The genera a commander can put a Genetic Sampler to, keyed by the `type`
  /// Spansh reports and valued by the name the bundled catalogue uses.
  ///
  /// A whitelist, not a blacklist, and the difference is not academic:
  /// `/api/bodies/field_values/landmarks` returns **64** distinct types, of
  /// which barely a third are sampleable life. The rest are geysers, gas
  /// vents, lava spouts, crystal formations, Thargoid and Guardian sites,
  /// crashed ships and Lagrange clouds — several of them organic-looking
  /// enough (Molluscs, Peduncle Pods, Gyre Trees) that a blacklist would have
  /// let them through and quoted the commander a payout for something they
  /// cannot sample.
  ///
  /// Three names need translating and one genus answers to two spellings
  /// (`Shards` and `Crystalline Shard`); the other twenty match as they are.
  static const Map<String, String> sampleableGenera = <String, String>{
    'Aleoida': 'Aleoida',
    'Amphora Plant': 'Amphora Plant',
    'Anemone': 'Anemone',
    'Bacterium': 'Bacterium',
    'Bark Mounds': 'Bark Mound',
    'Brain Tree': 'Brain Tree',
    'Cactoida': 'Cactoida',
    'Clypeus': 'Clypeus',
    'Concha': 'Concha',
    'Crystalline Shard': 'Crystalline Shard',
    'Electricae': 'Electricae',
    'Fonticulua': 'Fonticulua',
    'Frutexa': 'Frutexa',
    'Fumerola': 'Fumerola',
    'Fungoida': 'Fungoida',
    'Osseus': 'Osseus',
    'Radicoida': 'Radicoida',
    'Recepta': 'Recepta',
    'Shards': 'Crystalline Shard',
    'Stratum': 'Stratum',
    'Tubers': 'Sinuous Tuber',
    'Tubus': 'Tubus',
    'Tussock': 'Tussock',
  };

  /// The catalogue name for a Spansh landmark `type`, or null when that type
  /// is not something a Genetic Sampler can touch.
  static String? genusFor(String? type) =>
      type == null ? null : sampleableGenera[type];
}
