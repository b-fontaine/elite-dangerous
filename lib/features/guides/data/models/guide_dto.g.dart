// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guide_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuideIndexDto _$GuideIndexDtoFromJson(Map<String, dynamic> json) =>
    GuideIndexDto(
      guides: (json['guides'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

GuideDto _$GuideDtoFromJson(Map<String, dynamic> json) => GuideDto(
  id: json['id'] as String,
  title: json['title'] as String,
  edition: json['edition'] as String,
  kicker: json['kicker'] as String?,
  deck: json['deck'] as String?,
  byline: json['byline'] as String?,
  topics: (json['topics'] as List<dynamic>?)?.map((e) => e as String).toList(),
  estimatedReadMinutes: (json['estimatedReadMinutes'] as num?)?.toInt(),
  sections: (json['sections'] as List<dynamic>?)
      ?.map((e) => GuideSectionDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  sources: (json['sources'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

GuideSectionDto _$GuideSectionDtoFromJson(Map<String, dynamic> json) =>
    GuideSectionDto(
      id: json['id'] as String,
      title: json['title'] as String,
      number: (json['number'] as num?)?.toInt(),
      blocks: (json['blocks'] as List<dynamic>?)
          ?.map((e) => GuideBlockDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

GuideParagraphDto _$GuideParagraphDtoFromJson(Map<String, dynamic> json) =>
    GuideParagraphDto(
      text: json['text'] as String,
      emphasis: json['emphasis'] as String?,
    );

GuideHeadingDto _$GuideHeadingDtoFromJson(Map<String, dynamic> json) =>
    GuideHeadingDto(
      text: json['text'] as String,
      level: (json['level'] as num?)?.toInt(),
    );

GuideListDto _$GuideListDtoFromJson(Map<String, dynamic> json) => GuideListDto(
  items: (json['items'] as List<dynamic>?)?.map((e) => e as String).toList(),
  ordered: json['ordered'] as bool?,
);

GuideStepItemDto _$GuideStepItemDtoFromJson(Map<String, dynamic> json) =>
    GuideStepItemDto(
      text: json['text'] as String,
      detail: json['detail'] as String?,
    );

GuideStepsDto _$GuideStepsDtoFromJson(Map<String, dynamic> json) =>
    GuideStepsDto(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => GuideStepItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

GuideTableCellDto _$GuideTableCellDtoFromJson(Map<String, dynamic> json) =>
    GuideTableCellDto(
      text: json['text'] as String,
      style: json['style'] as String?,
    );

GuideTableDto _$GuideTableDtoFromJson(Map<String, dynamic> json) =>
    GuideTableDto(
      headers: (json['headers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      rows: (json['rows'] as List<dynamic>?)
          ?.map(
            (e) => (e as List<dynamic>)
                .map(
                  (e) => GuideTableCellDto.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          )
          .toList(),
      caption: json['caption'] as String?,
    );

GuideCalloutDto _$GuideCalloutDtoFromJson(Map<String, dynamic> json) =>
    GuideCalloutDto(
      text: json['text'] as String,
      tone: json['tone'] as String?,
      title: json['title'] as String?,
    );

GuideQuoteDto _$GuideQuoteDtoFromJson(Map<String, dynamic> json) =>
    GuideQuoteDto(
      text: json['text'] as String,
      attribution: json['attribution'] as String?,
    );

GuideVerdictDto _$GuideVerdictDtoFromJson(Map<String, dynamic> json) =>
    GuideVerdictDto(
      title: json['title'] as String,
      text: json['text'] as String,
    );

GuideKeyValueDto _$GuideKeyValueDtoFromJson(Map<String, dynamic> json) =>
    GuideKeyValueDto(
      label: json['label'] as String,
      value: json['value'] as String,
      reliability: json['reliability'] as String?,
    );

GuideKeyValuesDto _$GuideKeyValuesDtoFromJson(Map<String, dynamic> json) =>
    GuideKeyValuesDto(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => GuideKeyValueDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
