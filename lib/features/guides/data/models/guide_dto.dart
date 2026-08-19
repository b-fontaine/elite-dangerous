import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/guide.dart';

part 'guide_dto.g.dart';

/// Wire format of `assets/guides/index.json`.
@JsonSerializable(createToJson: false)
class GuideIndexDto {
  const GuideIndexDto({required this.guides});

  factory GuideIndexDto.fromJson(Map<String, dynamic> json) =>
      _$GuideIndexDtoFromJson(json);

  final List<String> guides;
}

/// Wire format of `assets/guides/<id>.json`.
///
/// Optional collections are nullable here and coalesced in [toEntity]: an
/// authored guide that omits `sources` must still open, whereas one without an
/// `id` is genuinely broken and has to surface as a failure.
@JsonSerializable(createToJson: false)
class GuideDto {
  const GuideDto({
    required this.id,
    required this.title,
    required this.edition,
    this.kicker,
    this.deck,
    this.byline,
    this.topics,
    this.estimatedReadMinutes,
    this.sections,
    this.sources,
  });

  factory GuideDto.fromJson(Map<String, dynamic> json) =>
      _$GuideDtoFromJson(json);

  final String id;
  final String title;
  final String? kicker;
  final String? deck;
  final String? byline;
  final String edition;
  final List<String>? topics;
  final int? estimatedReadMinutes;
  final List<GuideSectionDto>? sections;
  final List<String>? sources;

  Guide toEntity() => Guide(
        id: id,
        title: title,
        kicker: kicker,
        deck: deck,
        byline: byline,
        edition: edition,
        topics: topics ?? const <String>[],
        estimatedReadMinutes: estimatedReadMinutes ?? 0,
        sections: (sections ?? const <GuideSectionDto>[])
            .map((GuideSectionDto dto) => dto.toEntity())
            .toList(growable: false),
        sources: sources ?? const <String>[],
      );
}

@JsonSerializable(createToJson: false)
class GuideSectionDto {
  const GuideSectionDto({
    required this.id,
    required this.title,
    this.number,
    this.blocks,
  });

  factory GuideSectionDto.fromJson(Map<String, dynamic> json) =>
      _$GuideSectionDtoFromJson(json);

  final String id;
  final int? number;
  final String title;
  final List<GuideBlockDto>? blocks;

  GuideSection toEntity() => GuideSection(
        id: id,
        number: number,
        title: title,
        blocks: (blocks ?? const <GuideBlockDto>[])
            .map((GuideBlockDto dto) => dto.toEntity())
            .toList(growable: false),
      );
}

/// Polymorphic block payload.
///
/// json_serializable has no first-class discriminated union, so the dispatch on
/// the mandatory `type` field is written by hand. An unknown or missing type is
/// a [FormatException] rather than a silently dropped block: a guide that lost
/// a paragraph is worse than a guide that refuses to open.
sealed class GuideBlockDto {
  const GuideBlockDto();

  factory GuideBlockDto.fromJson(Map<String, dynamic> json) {
    final Object? type = json['type'];
    if (type is! String) {
      throw const FormatException('Bloc de guide sans champ « type ».');
    }
    return switch (type) {
      'paragraph' => GuideParagraphDto.fromJson(json),
      'heading' => GuideHeadingDto.fromJson(json),
      'list' => GuideListDto.fromJson(json),
      'steps' => GuideStepsDto.fromJson(json),
      'table' => GuideTableDto.fromJson(json),
      'callout' => GuideCalloutDto.fromJson(json),
      'quote' => GuideQuoteDto.fromJson(json),
      'verdict' => GuideVerdictDto.fromJson(json),
      'keyValue' => GuideKeyValuesDto.fromJson(json),
      'divider' => const GuideDividerDto(),
      _ => throw FormatException('Type de bloc de guide inconnu : « $type ».'),
    };
  }

  GuideBlock toEntity();
}

@JsonSerializable(createToJson: false)
final class GuideParagraphDto extends GuideBlockDto {
  const GuideParagraphDto({required this.text, this.emphasis});

  factory GuideParagraphDto.fromJson(Map<String, dynamic> json) =>
      _$GuideParagraphDtoFromJson(json);

  final String text;
  final String? emphasis;

  @override
  GuideParagraph toEntity() =>
      GuideParagraph(text: text, isIntro: emphasis == 'intro');
}

@JsonSerializable(createToJson: false)
final class GuideHeadingDto extends GuideBlockDto {
  const GuideHeadingDto({required this.text, this.level});

  factory GuideHeadingDto.fromJson(Map<String, dynamic> json) =>
      _$GuideHeadingDtoFromJson(json);

  final String text;
  final int? level;

  @override
  GuideHeading toEntity() => GuideHeading(text: text, level: level ?? 3);
}

@JsonSerializable(createToJson: false)
final class GuideListDto extends GuideBlockDto {
  const GuideListDto({this.items, this.ordered});

  factory GuideListDto.fromJson(Map<String, dynamic> json) =>
      _$GuideListDtoFromJson(json);

  final List<String>? items;
  final bool? ordered;

  @override
  GuideList toEntity() => GuideList(
        items: items ?? const <String>[],
        ordered: ordered ?? false,
      );
}

@JsonSerializable(createToJson: false)
class GuideStepItemDto {
  const GuideStepItemDto({required this.text, this.detail});

  factory GuideStepItemDto.fromJson(Map<String, dynamic> json) =>
      _$GuideStepItemDtoFromJson(json);

  final String text;
  final String? detail;

  GuideStepItem toEntity() => GuideStepItem(text: text, detail: detail);
}

@JsonSerializable(createToJson: false)
final class GuideStepsDto extends GuideBlockDto {
  const GuideStepsDto({this.items});

  factory GuideStepsDto.fromJson(Map<String, dynamic> json) =>
      _$GuideStepsDtoFromJson(json);

  final List<GuideStepItemDto>? items;

  @override
  GuideStepsBlock toEntity() => GuideStepsBlock(
        items: (items ?? const <GuideStepItemDto>[])
            .map((GuideStepItemDto dto) => dto.toEntity())
            .toList(growable: false),
      );
}

@JsonSerializable(createToJson: false)
class GuideTableCellDto {
  const GuideTableCellDto({required this.text, this.style});

  factory GuideTableCellDto.fromJson(Map<String, dynamic> json) =>
      _$GuideTableCellDtoFromJson(json);

  final String text;
  final String? style;

  GuideTableCell toEntity() => GuideTableCell(
        text: text,
        style: switch (style) {
          'number' => GuideCellStyle.number,
          'win' => GuideCellStyle.win,
          'lose' => GuideCellStyle.lose,
          'mid' => GuideCellStyle.mid,
          'strong' => GuideCellStyle.strong,
          _ => GuideCellStyle.normal,
        },
      );
}

@JsonSerializable(createToJson: false)
final class GuideTableDto extends GuideBlockDto {
  const GuideTableDto({this.headers, this.rows, this.caption});

  factory GuideTableDto.fromJson(Map<String, dynamic> json) =>
      _$GuideTableDtoFromJson(json);

  final List<String>? headers;
  final List<List<GuideTableCellDto>>? rows;
  final String? caption;

  @override
  GuideTable toEntity() => GuideTable(
        headers: headers ?? const <String>[],
        rows: (rows ?? const <List<GuideTableCellDto>>[])
            .map((List<GuideTableCellDto> row) => row
                .map((GuideTableCellDto dto) => dto.toEntity())
                .toList(growable: false))
            .toList(growable: false),
        caption: caption,
      );
}

@JsonSerializable(createToJson: false)
final class GuideCalloutDto extends GuideBlockDto {
  const GuideCalloutDto({required this.text, this.tone, this.title});

  factory GuideCalloutDto.fromJson(Map<String, dynamic> json) =>
      _$GuideCalloutDtoFromJson(json);

  final String? tone;
  final String? title;
  final String text;

  @override
  GuideCallout toEntity() => GuideCallout(
        tone: switch (tone) {
          'warning' => GuideCalloutTone.warning,
          'tip' => GuideCalloutTone.tip,
          _ => GuideCalloutTone.info,
        },
        title: title,
        text: text,
      );
}

@JsonSerializable(createToJson: false)
final class GuideQuoteDto extends GuideBlockDto {
  const GuideQuoteDto({required this.text, this.attribution});

  factory GuideQuoteDto.fromJson(Map<String, dynamic> json) =>
      _$GuideQuoteDtoFromJson(json);

  final String text;
  final String? attribution;

  @override
  GuideQuote toEntity() => GuideQuote(text: text, attribution: attribution);
}

@JsonSerializable(createToJson: false)
final class GuideVerdictDto extends GuideBlockDto {
  const GuideVerdictDto({required this.title, required this.text});

  factory GuideVerdictDto.fromJson(Map<String, dynamic> json) =>
      _$GuideVerdictDtoFromJson(json);

  final String title;
  final String text;

  @override
  GuideVerdict toEntity() => GuideVerdict(title: title, text: text);
}

@JsonSerializable(createToJson: false)
class GuideKeyValueDto {
  const GuideKeyValueDto({
    required this.label,
    required this.value,
    this.reliability,
  });

  factory GuideKeyValueDto.fromJson(Map<String, dynamic> json) =>
      _$GuideKeyValueDtoFromJson(json);

  final String label;
  final String value;
  final String? reliability;

  GuideKeyValue toEntity() => GuideKeyValue(
        label: label,
        value: value,
        reliability: switch (reliability) {
          'official' => GuideReliability.official,
          'estimate' => GuideReliability.estimate,
          _ => GuideReliability.community,
        },
      );
}

@JsonSerializable(createToJson: false)
final class GuideKeyValuesDto extends GuideBlockDto {
  const GuideKeyValuesDto({this.items});

  factory GuideKeyValuesDto.fromJson(Map<String, dynamic> json) =>
      _$GuideKeyValuesDtoFromJson(json);

  final List<GuideKeyValueDto>? items;

  @override
  GuideKeyValues toEntity() => GuideKeyValues(
        items: (items ?? const <GuideKeyValueDto>[])
            .map((GuideKeyValueDto dto) => dto.toEntity())
            .toList(growable: false),
      );
}

final class GuideDividerDto extends GuideBlockDto {
  const GuideDividerDto();

  @override
  GuideDivider toEntity() => const GuideDivider();
}
