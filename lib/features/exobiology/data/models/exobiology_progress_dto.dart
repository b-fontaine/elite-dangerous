import '../../domain/entities/exobiology_progress.dart';
import '../../domain/entities/sample_record.dart';

/// Local persistence format of [ExobiologyProgress].
///
/// This is the commander's save: there is no server behind it, so the reader is
/// deliberately forgiving. A record that cannot be understood is dropped rather
/// than taking the whole file down with it.
abstract final class ExobiologyProgressDto {
  static const int schemaVersion = 1;

  static Map<String, dynamic> toJson(ExobiologyProgress progress) =>
      <String, dynamic>{
        'version': schemaVersion,
        'declaredProfitCr': progress.declaredProfitCr,
        'completedStepIds': progress.completedStepIds.toList(),
        'dismissedStepIds': progress.dismissedStepIds.toList(),
        'lastUpdatedAt': progress.lastUpdatedAt?.toIso8601String(),
        'records': progress.records.map(_recordToJson).toList(),
      };

  static ExobiologyProgress fromJson(Map<String, dynamic> json) {
    return ExobiologyProgress(
      declaredProfitCr: _int(json['declaredProfitCr']) ?? 0,
      completedStepIds: _stringSet(json['completedStepIds']),
      dismissedStepIds: _stringSet(json['dismissedStepIds']),
      lastUpdatedAt: _dateTime(json['lastUpdatedAt']),
      records: <SampleRecord>[
        for (final Object? entry in _list(json['records']))
          if (entry is Map<String, dynamic>)
            if (_recordFromJson(entry) case final SampleRecord record) record,
      ],
    );
  }

  static Map<String, dynamic> _recordToJson(SampleRecord record) =>
      <String, dynamic>{
        'speciesId': record.speciesId,
        'speciesName': record.speciesName,
        'genusId': record.genusId,
        'bodyName': record.bodyName,
        'systemName': record.systemName,
        'samplesTaken': record.samplesTaken,
        'variantName': record.variantName,
        'estimatedValueCr': record.estimatedValueCr,
        'soldAt': record.soldAt?.toIso8601String(),
        'soldValueCr': record.soldValueCr,
        'firstLogged': record.firstLogged,
        'firstFootfall': record.firstFootfall,
        'scannedAt': record.scannedAt?.toIso8601String(),
      };

  static SampleRecord? _recordFromJson(Map<String, dynamic> json) {
    final Object? speciesId = json['speciesId'];
    final Object? bodyName = json['bodyName'];
    if (speciesId is! String || speciesId.isEmpty || bodyName is! String) {
      return null;
    }
    return SampleRecord(
      speciesId: speciesId,
      speciesName: json['speciesName'] as String? ?? speciesId,
      genusId: json['genusId'] as String? ?? '',
      bodyName: bodyName,
      systemName: json['systemName'] as String? ?? '',
      samplesTaken: _int(json['samplesTaken']) ?? 0,
      variantName: json['variantName'] as String?,
      estimatedValueCr: _int(json['estimatedValueCr']),
      soldAt: _dateTime(json['soldAt']),
      soldValueCr: _int(json['soldValueCr']),
      firstLogged: json['firstLogged'] == true,
      firstFootfall: json['firstFootfall'] == true,
      scannedAt: _dateTime(json['scannedAt']),
    );
  }

  static int? _int(Object? value) => switch (value) {
        final int v => v,
        final double v => v.round(),
        final String v => int.tryParse(v),
        _ => null,
      };

  static DateTime? _dateTime(Object? value) =>
      value is String ? DateTime.tryParse(value) : null;

  static List<Object?> _list(Object? value) =>
      value is List<Object?> ? value : const <Object?>[];

  static Set<String> _stringSet(Object? value) =>
      _list(value).whereType<String>().toSet();
}
