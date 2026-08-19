import 'package:equatable/equatable.dart';

/// The four Odyssey suits, keyed by the symbol Frontier uses.
enum SuitKind {
  artemis('explorationsuit', 'Artemis Suit', 'Genetic Sampler — exobiologie'),
  maverick('utilitysuit', 'Maverick Suit', 'Arc Cutter — récolte de matériaux'),
  dominator('tacticalsuit', 'Dominator Suit', 'Combat au sol'),
  flight('flightsuit', 'Flight Suit', 'Combinaison de vol, sans outil'),
  unknown('', 'Combinaison inconnue', '');

  const SuitKind(this.symbolPrefix, this.label, this.role);

  final String symbolPrefix;
  final String label;
  final String role;
}

/// A suit the commander owns.
///
/// Frontier does not expose a `grade` field: the grade is encoded in the
/// symbol's `_classN` suffix. It also ships a long-standing bug where
/// `locName` is the raw localisation key (`$TacticalSuit_Class3_Name;`) for
/// anything above grade 1 — so both are parsed here rather than displayed raw.
class SuitInfo extends Equatable {
  const SuitInfo({
    required this.symbol,
    required this.kind,
    required this.grade,
    this.displayName,
    this.suitId,
    this.modIds = const <String>{},
  });

  /// Parses a CAPI or Journal suit symbol such as `explorationsuit_class3`.
  ///
  /// Also accepts the broken localisation key form, so a caller can pass
  /// whichever of `name` / `locName` it happens to have.
  factory SuitInfo.fromSymbol(
    String symbol, {
    String? locName,
    int? suitId,
    Set<String> modIds = const <String>{},
  }) {
    final String normalised = normaliseSymbol(symbol);
    return SuitInfo(
      symbol: normalised,
      kind: kindOf(normalised),
      grade: gradeOf(normalised),
      displayName: prettyName(locName ?? symbol) ?? kindOf(normalised).label,
      suitId: suitId,
      modIds: modIds,
    );
  }

  final String symbol;
  final SuitKind kind;

  /// 1 to 5. Zero when the symbol carries no class suffix (the Flight Suit).
  final int grade;

  final String? displayName;
  final int? suitId;
  final Set<String> modIds;

  bool get isArtemis => kind == SuitKind.artemis;

  bool get canBeModified => grade >= 2;

  int get modificationSlots => grade <= 1 ? 0 : grade - 1;

  /// `$TacticalSuit_Class3_Name;` → `tacticalsuit_class3`.
  static final RegExp _localisationKey =
      RegExp(r'^\$([^_]+)_Class([0-9]+)_Name;$', caseSensitive: false);

  static final RegExp _classSuffix =
      RegExp(r'^(.+?)_class([0-9]+)$', caseSensitive: false);

  static String normaliseSymbol(String raw) {
    final String trimmed = raw.trim();
    final RegExpMatch? key = _localisationKey.firstMatch(trimmed);
    if (key != null) {
      return '${key.group(1)!.toLowerCase()}_class${key.group(2)}';
    }
    return trimmed.toLowerCase();
  }

  static SuitKind kindOf(String symbol) {
    final String normalised = normaliseSymbol(symbol);
    for (final SuitKind kind in SuitKind.values) {
      if (kind.symbolPrefix.isNotEmpty &&
          normalised.startsWith(kind.symbolPrefix)) {
        return kind;
      }
    }
    return SuitKind.unknown;
  }

  static int gradeOf(String symbol) {
    final RegExpMatch? match = _classSuffix.firstMatch(normaliseSymbol(symbol));
    return match == null ? 0 : int.tryParse(match.group(2)!) ?? 0;
  }

  /// Human name for a `locName`, or `null` when Frontier gave us the raw key.
  static String? prettyName(String? locName) {
    if (locName == null || locName.isEmpty) {
      return null;
    }
    if (locName.startsWith(r'$')) {
      final SuitKind kind = kindOf(locName);
      final int grade = gradeOf(locName);
      if (kind == SuitKind.unknown) {
        return null;
      }
      return grade > 0 ? '${kind.label} — grade $grade' : kind.label;
    }
    return locName;
  }

  @override
  List<Object?> get props => <Object?>[symbol, kind, grade, modIds];
}
