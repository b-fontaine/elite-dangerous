import 'dart:convert';
import 'dart:io';

import 'package:elite_dangerous/features/guides/data/models/guide_mapper.dart';
import 'package:elite_dangerous/features/guides/domain/entities/guide.dart';
import 'package:flutter_test/flutter_test.dart';

/// Integrity checks on the guide library that actually ships.
///
/// The guides are authored content converted from the source HTML, so nothing
/// else would catch a truncated conversion, a duplicated section id, or a guide
/// that silently stopped parsing.
void main() {
  late List<String> ids;
  final Map<String, Guide> guides = <String, Guide>{};

  setUpAll(() {
    ids = GuideMapper.parseIndex(
      File('assets/guides/index.json').readAsStringSync(),
    ).valueOrNull!;
    for (final String id in ids) {
      final String raw = File('assets/guides/$id.json').readAsStringSync();
      guides[id] = GuideMapper.parseGuide(raw).valueOrNull!;
    }
  });

  test('the index lists every shipped guide', () {
    final Set<String> files = Directory('assets/guides')
        .listSync()
        .whereType<File>()
        .map((File file) => file.uri.pathSegments.last)
        .where((String name) => name.endsWith('.json') && name != 'index.json')
        .map((String name) => name.substring(0, name.length - 5))
        .toSet();

    expect(ids.toSet(), files);
  });

  test('every guide parses, with an id, a title and an edition', () {
    for (final String id in ids) {
      final Guide guide = guides[id]!;
      expect(guide.id, id);
      expect(guide.title, isNotEmpty, reason: id);
      expect(guide.edition, isNotEmpty, reason: id);
    }
  });

  test('every guide carries real content, not a summary', () {
    for (final MapEntry<String, Guide> entry in guides.entries) {
      final int blocks = entry.value.sections
          .fold<int>(0, (int sum, GuideSection s) => sum + s.blocks.length);
      expect(entry.value.sections.length, greaterThanOrEqualTo(4),
          reason: entry.key);
      expect(blocks, greaterThanOrEqualTo(40), reason: entry.key);
    }
  });

  test('section ids are unique within a guide', () {
    for (final MapEntry<String, Guide> entry in guides.entries) {
      final List<String> sectionIds =
          entry.value.sections.map((GuideSection s) => s.id).toList();
      expect(sectionIds.toSet().length, sectionIds.length, reason: entry.key);
    }
  });

  test('no block is empty', () {
    for (final MapEntry<String, Guide> entry in guides.entries) {
      for (final GuideSection section in entry.value.sections) {
        expect(section.title, isNotEmpty, reason: '${entry.key}/${section.id}');
        for (final GuideBlock block in section.blocks) {
          switch (block) {
            case GuideParagraph(:final String text):
              expect(text, isNotEmpty, reason: entry.key);
            case GuideHeading(:final String text):
              expect(text, isNotEmpty, reason: entry.key);
            case GuideTable(:final List<String> headers):
              expect(headers, isNotEmpty, reason: entry.key);
            case GuideList(:final List<String> items):
              expect(items, isNotEmpty, reason: entry.key);
            case GuideStepsBlock(:final List<GuideStepItem> items):
              expect(items, isNotEmpty, reason: entry.key);
            case GuideCallout(:final String text):
              expect(text, isNotEmpty, reason: entry.key);
            case GuideQuote(:final String text):
              expect(text, isNotEmpty, reason: entry.key);
            case GuideVerdict(:final String text):
              expect(text, isNotEmpty, reason: entry.key);
            case GuideKeyValues(:final List<GuideKeyValue> items):
              expect(items, isNotEmpty, reason: entry.key);
            case GuideDivider():
              break;
          }
        }
      }
    }
  });

  test('table rows all have the same width as their header', () {
    for (final MapEntry<String, Guide> entry in guides.entries) {
      for (final GuideSection section in entry.value.sections) {
        for (final GuideTable table
            in section.blocks.whereType<GuideTable>()) {
          for (final List<GuideTableCell> row in table.rows) {
            expect(
              row.length,
              table.headers.length,
              reason: '${entry.key}/${section.id}: ${table.headers}',
            );
          }
        }
      }
    }
  });

  test('the guides the roadmap references are all present', () {
    // Every RoadmapReference with a guideId must resolve, or a commander
    // following the roadmap hits a dead link.
    const Set<String> referenced = <String>{
      'artemis-suit',
      'exploration-exobiologie',
      'protocole-milliard',
    };
    expect(ids.toSet(), containsAll(referenced));
  });

  test('the library is valid UTF-8 French, not escaped ASCII', () {
    for (final String id in ids) {
      final String raw = File('assets/guides/$id.json').readAsStringSync();
      // A converter that emitted \u00e9 instead of é would read as broken
      // French the moment the JSON is opened by a human.
      expect(raw, isNot(contains(r'\u00')), reason: id);
      expect(raw, contains('é'), reason: id);
      expect(jsonDecode(raw), isA<Map<String, dynamic>>(), reason: id);
    }
  });
}
