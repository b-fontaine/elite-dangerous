import '../../domain/entities/manual_commander_overrides.dart';

/// Local persistence format of [ManualCommanderOverrides].
abstract final class ManualOverridesDto {
  static Map<String, dynamic> toJson(ManualCommanderOverrides o) =>
      <String, dynamic>{
        'commanderName': o.commanderName,
        'creditBalance': o.creditBalance,
        'currentSystem': o.currentSystem,
        'shipName': o.shipName,
        'jumpRangeLy': o.jumpRangeLy,
        'explorerRankLevel': o.explorerRankLevel,
        'artemisGrade': o.artemisGrade,
        'ownsMaverick': o.ownsMaverick,
        'installedModIds': o.installedModIds.toList(),
        'unlockedSuitEngineerIds': o.unlockedSuitEngineerIds.toList(),
        'unlockedShipEngineerIds': o.unlockedShipEngineerIds.toList(),
        'suitMaterials': o.suitMaterials,
        'hasMetaAlloy': o.hasMetaAlloy,
        'hasFsdIncreasedRangeG5': o.hasFsdIncreasedRangeG5,
        'hasMassManager': o.hasMassManager,
        'hasGuardianFsdBooster': o.hasGuardianFsdBooster,
        'hasDetailedSurfaceScanner': o.hasDetailedSurfaceScanner,
        'pledgedPower': o.pledgedPower,
        'declaredExobiologyProfitCr': o.declaredExobiologyProfitCr,
      };

  static ManualCommanderOverrides fromJson(Map<String, dynamic> json) =>
      ManualCommanderOverrides(
        commanderName: _string(json['commanderName']),
        creditBalance: _int(json['creditBalance']),
        currentSystem: _string(json['currentSystem']),
        shipName: _string(json['shipName']),
        jumpRangeLy: _double(json['jumpRangeLy']),
        explorerRankLevel: _int(json['explorerRankLevel']),
        artemisGrade: _int(json['artemisGrade']),
        ownsMaverick: json['ownsMaverick'] == true,
        installedModIds: _stringSet(json['installedModIds']),
        unlockedSuitEngineerIds: _stringSet(json['unlockedSuitEngineerIds']),
        unlockedShipEngineerIds: _stringSet(json['unlockedShipEngineerIds']),
        suitMaterials: _intMap(json['suitMaterials']),
        hasMetaAlloy: json['hasMetaAlloy'] == true,
        hasFsdIncreasedRangeG5: json['hasFsdIncreasedRangeG5'] == true,
        hasMassManager: json['hasMassManager'] == true,
        hasGuardianFsdBooster: json['hasGuardianFsdBooster'] == true,
        hasDetailedSurfaceScanner: json['hasDetailedSurfaceScanner'] == true,
        pledgedPower: _string(json['pledgedPower']),
        declaredExobiologyProfitCr: _int(json['declaredExobiologyProfitCr']),
      );

  static String? _string(Object? value) =>
      value is String && value.isNotEmpty ? value : null;

  static int? _int(Object? value) => switch (value) {
        final int v => v,
        final double v => v.round(),
        final String v => int.tryParse(v),
        _ => null,
      };

  static double? _double(Object? value) => switch (value) {
        final double v => v,
        final int v => v.toDouble(),
        final String v => double.tryParse(v),
        _ => null,
      };

  static Set<String> _stringSet(Object? value) => value is List<dynamic>
      ? value.whereType<String>().toSet()
      : const <String>{};

  static Map<String, int> _intMap(Object? value) {
    if (value is! Map<String, dynamic>) {
      return const <String, int>{};
    }
    return <String, int>{
      for (final MapEntry<String, dynamic> entry in value.entries)
        if (_int(entry.value) case final int quantity) entry.key: quantity,
    };
  }
}
