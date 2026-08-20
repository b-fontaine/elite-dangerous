import 'package:equatable/equatable.dart';

/// Which inventory a material lives in.
///
/// The three ship types are separate stores that a material trader can never
/// bridge: no amount of Encoded data buys a single Raw element. Odyssey
/// micro-resources are a fourth store again, held in the backpack and the ship
/// locker, and no trader touches them at all.
enum MaterialType {
  raw('raw', 'Brut'),
  manufactured('manufactured', 'Manufacturé'),
  encoded('encoded', 'Encodé'),
  odyssey('odyssey', 'À pied');

  const MaterialType(this.code, this.label);

  final String code;
  final String label;

  static MaterialType fromCode(String? code) {
    for (final MaterialType type in MaterialType.values) {
      if (type.code == code?.trim().toLowerCase()) {
        return type;
      }
    }
    return MaterialType.raw;
  }

  /// Whether a material trader deals in this store.
  bool get hasTrader => this != MaterialType.odyssey;
}

/// How a material is obtained.
///
/// A closed set so the UI can give each way its own icon and its own tone.
/// [unknown] exists so a dataset written after this code still loads.
enum MaterialSourceKind {
  surfaceProspecting('surface_prospecting', 'Prospection de surface'),
  bodyType('body_type', 'Type de corps'),
  asteroidMining('asteroid_mining', 'Minage d\'astéroïdes'),
  hge('hge', 'High Grade Emission'),
  salvage('salvage', 'Épaves et récupération'),
  datapoint('datapoint', 'Data point'),
  shipScan('ship_scan', 'Scan de vaisseau'),
  wake('wake', 'Scanner de sillage'),
  mission('mission', 'Mission'),
  trader('trader', 'Material trader'),
  settlement('settlement', 'Settlement'),
  bartender('bartender', 'Bartender'),
  site('site', 'Site connu'),
  unknown('', 'Autre');

  const MaterialSourceKind(this.code, this.label);

  final String code;
  final String label;

  static MaterialSourceKind fromCode(String? code) {
    for (final MaterialSourceKind kind in MaterialSourceKind.values) {
      if (kind.code.isNotEmpty && kind.code == code?.trim().toLowerCase()) {
        return kind;
      }
    }
    return MaterialSourceKind.unknown;
  }
}

/// One documented way of getting a material.
class MaterialSource extends Equatable {
  const MaterialSource({
    required this.kind,
    required this.detail,
    this.conditions,
  });

  final MaterialSourceKind kind;

  /// What to do, in one or two sentences.
  final String detail;

  /// What has to be true for it to work — the part that separates a useful
  /// answer from a wasted trip.
  final String? conditions;

  @override
  List<Object?> get props => <Object?>[kind, detail, conditions];
}

/// A trader category: the seven Raw groups, the ten Manufactured families, the
/// six Encoded ones.
///
/// It carries the sources shared by everything inside it, which is where most
/// of the useful advice lives: what applies to one Wake Scan applies to all
/// five.
class MaterialCategory extends Equatable {
  const MaterialCategory({
    required this.id,
    required this.type,
    required this.name,
    this.sources = const <MaterialSource>[],
  });

  final String id;
  final MaterialType type;
  final String name;
  final List<MaterialSource> sources;

  @override
  List<Object?> get props => <Object?>[id, type, name, sources];
}

/// One of the 108 tradable materials, or one of the Odyssey components.
class EngineeringMaterial extends Equatable {
  const EngineeringMaterial({
    required this.id,
    required this.name,
    required this.type,
    required this.categoryId,
    this.grade,
    this.storageCap,
    this.odysseyCategory,
    this.valueCr,
    this.sources = const <MaterialSource>[],
  });

  /// The journal's internal symbol, lower-cased — `disruptedwakeechoes`, not
  /// `Atypical Disrupted Wake Echoes`. Thirty-two of the 108 differ from their
  /// display name by more than spacing, so the two cannot be derived from one
  /// another.
  final String id;

  /// The English name, which is what the guides, the engineers' screens and
  /// the rest of this app all use.
  final String name;

  final MaterialType type;
  final String categoryId;

  /// 1 to 5 for ship materials — there is no Raw grade 5. Null for Odyssey
  /// components, which have no grade.
  final int? grade;

  /// How many the commander may hold. Since the Dodec Update (11 November
  /// 2025) the overflow is paid in credits rather than lost.
  final int? storageCap;

  /// `Asset`, `Good` or `Data` — the Odyssey split that decides whether the
  /// bartender will sell it back.
  final String? odysseyCategory;

  final int? valueCr;

  /// Ways of getting *this* material specifically. Whatever applies to its
  /// whole category lives on [MaterialCategory] instead.
  final List<MaterialSource> sources;

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        type,
        categoryId,
        grade,
        storageCap,
        odysseyCategory,
        valueCr,
        sources,
      ];
}

/// A known farming spot, with the coordinates that actually work.
class FarmingSite extends Equatable {
  const FarmingSite({
    required this.id,
    required this.name,
    required this.system,
    required this.body,
    required this.latitude,
    required this.longitude,
    this.yields,
    this.note,
  });

  final String id;
  final String name;
  final String system;
  final String body;
  final double latitude;
  final double longitude;

  /// What the site is worth going for.
  final String? yields;

  /// Anything that would otherwise send the commander to the wrong place.
  final String? note;

  @override
  List<Object?> get props =>
      <Object?>[id, name, system, body, latitude, longitude, yields, note];
}
