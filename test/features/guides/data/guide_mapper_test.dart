import 'package:elite_dangerous/core/error/failure.dart';
import 'package:elite_dangerous/core/result/result.dart';
import 'package:elite_dangerous/features/guides/data/models/guide_mapper.dart';
import 'package:elite_dangerous/features/guides/domain/entities/guide.dart';
import 'package:flutter_test/flutter_test.dart';

/// Exercises every block type of the authored guide schema at once.
const String _completeGuideJson = '''
{
  "id": "exploration-exobiologie",
  "title": "Explorer la galaxie",
  "kicker": "Elite Dangerous · Édition août 2026",
  "deck": "Le guide complet de l'exploration.",
  "byline": "PC · Live · Odyssey requis",
  "edition": "2026-08",
  "topics": ["exobiologie", "exploration"],
  "estimatedReadMinutes": 18,
  "sections": [
    {
      "id": "choisir-son-vaisseau",
      "number": 1,
      "title": "Choisir son vaisseau",
      "blocks": [
        {"type": "paragraph", "text": "Un **Diamondback** suffit.", "emphasis": "intro"},
        {"type": "paragraph", "text": "Le reste est du confort."},
        {"type": "heading", "text": "Portée de saut", "level": 3},
        {"type": "heading", "text": "Alléger", "level": 4},
        {"type": "list", "ordered": false, "items": ["Coque nue", "FSD grade 5"]},
        {"type": "list", "ordered": true, "items": ["Acheter", "Monter"]},
        {
          "type": "steps",
          "items": [
            {"text": "Scanner le système", "detail": "depuis la soute"},
            {"text": "Cartographier"}
          ]
        },
        {
          "type": "table",
          "headers": ["Vaisseau", "Portée", "Prix"],
          "caption": "Portées à vide.",
          "rows": [
            [
              {"text": "Diamondback Explorer", "style": "normal"},
              {"text": "62", "style": "number"},
              {"text": "Excellent", "style": "win"}
            ],
            [
              {"text": "Anaconda", "style": "strong"},
              {"text": "78", "style": "mid"},
              {"text": "Ruineux", "style": "lose"}
            ]
          ]
        },
        {"type": "callout", "tone": "warning", "title": "Le piège", "text": "Mourir efface tout."},
        {"type": "callout", "tone": "info", "text": "Le scan est gratuit."},
        {"type": "callout", "tone": "tip", "title": "À faire", "text": "Vendre souvent."},
        {"type": "quote", "text": "Fly safe.", "attribution": "CMDR Jameson"},
        {"type": "verdict", "title": "Verdict", "text": "Le DBX gagne."},
        {
          "type": "keyValue",
          "items": [
            {"label": "Portée", "value": "62 al", "reliability": "official"},
            {"label": "Prix", "value": "1,8 MCr", "reliability": "community"},
            {"label": "Rendement", "value": "~200 MCr/h", "reliability": "estimate"}
          ]
        },
        {"type": "divider"}
      ]
    }
  ],
  "sources": ["Frontier Developments", "Canonn Research"]
}
''';

void main() {
  group('GuideMapper.parseGuide', () {
    late Guide guide;

    setUp(() {
      final Result<Guide> result = GuideMapper.parseGuide(_completeGuideJson);
      expect(result.failureOrNull, isNull);
      guide = result.valueOrNull!;
    });

    test('maps the guide envelope', () {
      expect(guide.id, 'exploration-exobiologie');
      expect(guide.title, 'Explorer la galaxie');
      expect(guide.kicker, 'Elite Dangerous · Édition août 2026');
      expect(guide.deck, "Le guide complet de l'exploration.");
      expect(guide.byline, 'PC · Live · Odyssey requis');
      expect(guide.edition, '2026-08');
      expect(guide.topics, <String>['exobiologie', 'exploration']);
      expect(guide.estimatedReadMinutes, 18);
      expect(
        guide.sources,
        <String>['Frontier Developments', 'Canonn Research'],
      );
    });

    test('maps the sections', () {
      expect(guide.sections, hasLength(1));
      expect(guide.sections.single.id, 'choisir-son-vaisseau');
      expect(guide.sections.single.number, 1);
      expect(guide.sections.single.title, 'Choisir son vaisseau');
      expect(guide.sections.single.blocks, hasLength(15));
    });

    test('maps paragraphs and their emphasis', () {
      final List<GuideParagraph> paragraphs =
          guide.sections.single.blocks.whereType<GuideParagraph>().toList();

      expect(paragraphs, hasLength(2));
      expect(paragraphs.first.text, 'Un **Diamondback** suffit.');
      expect(paragraphs.first.isIntro, isTrue);
      expect(paragraphs.last.isIntro, isFalse);
    });

    test('maps headings and keeps their level', () {
      final List<GuideHeading> headings =
          guide.sections.single.blocks.whereType<GuideHeading>().toList();

      expect(headings.map((GuideHeading h) => h.level), <int>[3, 4]);
      expect(headings.first.text, 'Portée de saut');
    });

    test('maps ordered and unordered lists', () {
      final List<GuideList> lists =
          guide.sections.single.blocks.whereType<GuideList>().toList();

      expect(lists, hasLength(2));
      expect(lists.first.ordered, isFalse);
      expect(lists.first.items, <String>['Coque nue', 'FSD grade 5']);
      expect(lists.last.ordered, isTrue);
    });

    test('maps steps with their optional detail', () {
      final GuideStepsBlock steps =
          guide.sections.single.blocks.whereType<GuideStepsBlock>().single;

      expect(steps.items, hasLength(2));
      expect(steps.items.first.text, 'Scanner le système');
      expect(steps.items.first.detail, 'depuis la soute');
      expect(steps.items.last.detail, isNull);
    });

    test('maps tables, their caption and every cell style', () {
      final GuideTable table =
          guide.sections.single.blocks.whereType<GuideTable>().single;

      expect(table.headers, <String>['Vaisseau', 'Portée', 'Prix']);
      expect(table.caption, 'Portées à vide.');
      expect(table.rows, hasLength(2));
      expect(
        table.rows.first.map((GuideTableCell c) => c.style),
        <GuideCellStyle>[
          GuideCellStyle.normal,
          GuideCellStyle.number,
          GuideCellStyle.win,
        ],
      );
      expect(
        table.rows.last.map((GuideTableCell c) => c.style),
        <GuideCellStyle>[
          GuideCellStyle.strong,
          GuideCellStyle.mid,
          GuideCellStyle.lose,
        ],
      );
    });

    test('maps the three callout tones', () {
      final List<GuideCallout> callouts =
          guide.sections.single.blocks.whereType<GuideCallout>().toList();

      expect(
        callouts.map((GuideCallout c) => c.tone),
        <GuideCalloutTone>[
          GuideCalloutTone.warning,
          GuideCalloutTone.info,
          GuideCalloutTone.tip,
        ],
      );
      expect(callouts.first.title, 'Le piège');
      expect(callouts[1].title, isNull);
    });

    test('maps quotes and verdicts', () {
      final GuideQuote quote =
          guide.sections.single.blocks.whereType<GuideQuote>().single;
      final GuideVerdict verdict =
          guide.sections.single.blocks.whereType<GuideVerdict>().single;

      expect(quote.text, 'Fly safe.');
      expect(quote.attribution, 'CMDR Jameson');
      expect(verdict.title, 'Verdict');
      expect(verdict.text, 'Le DBX gagne.');
    });

    test('maps key/value pairs and their reliability', () {
      final GuideKeyValues keyValues =
          guide.sections.single.blocks.whereType<GuideKeyValues>().single;

      expect(
        keyValues.items.map((GuideKeyValue kv) => kv.reliability),
        <GuideReliability>[
          GuideReliability.official,
          GuideReliability.community,
          GuideReliability.estimate,
        ],
      );
      expect(keyValues.items.first.label, 'Portée');
      expect(keyValues.items.first.value, '62 al');
    });

    test('maps dividers', () {
      expect(
        guide.sections.single.blocks.whereType<GuideDivider>(),
        hasLength(1),
      );
    });

    test('the last block of the section is the divider', () {
      expect(guide.sections.single.blocks.last, const GuideDivider());
    });
  });

  group('GuideMapper.parseGuide failures', () {
    test('syntactically broken JSON yields a ParsingFailure', () {
      final Result<Guide> result = GuideMapper.parseGuide('{"id": "x",');

      expect(result.failureOrNull, isA<ParsingFailure>());
      expect(result.valueOrNull, isNull);
    });

    test('a JSON payload that is not an object yields a ParsingFailure', () {
      final Result<Guide> result = GuideMapper.parseGuide('[1, 2, 3]');

      expect(result.failureOrNull, isA<ParsingFailure>());
    });

    test('a missing mandatory field yields a ParsingFailure', () {
      final Result<Guide> result =
          GuideMapper.parseGuide('{"title": "Sans identifiant"}');

      expect(result.failureOrNull, isA<ParsingFailure>());
    });

    test('an unknown block type yields a ParsingFailure', () {
      const String json = '''
{
  "id": "x",
  "title": "X",
  "edition": "2026-08",
  "sections": [
    {"id": "s", "title": "S", "blocks": [{"type": "hologram", "text": "?"}]}
  ]
}
''';

      final Result<Guide> result = GuideMapper.parseGuide(json);

      expect(result.failureOrNull, isA<ParsingFailure>());
    });

    test('a block without a type yields a ParsingFailure', () {
      const String json = '''
{
  "id": "x",
  "title": "X",
  "edition": "2026-08",
  "sections": [
    {"id": "s", "title": "S", "blocks": [{"text": "?"}]}
  ]
}
''';

      final Result<Guide> result = GuideMapper.parseGuide(json);

      expect(result.failureOrNull, isA<ParsingFailure>());
    });

    test('an unknown enum value degrades to its neutral default', () {
      const String json = '''
{
  "id": "x",
  "title": "X",
  "edition": "2026-08",
  "sections": [
    {
      "id": "s",
      "title": "S",
      "blocks": [
        {"type": "callout", "tone": "panic", "text": "?"},
        {
          "type": "table",
          "headers": ["A"],
          "rows": [[{"text": "1", "style": "neon"}]]
        },
        {"type": "keyValue", "items": [{"label": "l", "value": "v", "reliability": "rumour"}]}
      ]
    }
  ]
}
''';

      final Guide guide = GuideMapper.parseGuide(json).valueOrNull!;
      final List<GuideBlock> blocks = guide.sections.single.blocks;

      expect(
        blocks.whereType<GuideCallout>().single.tone,
        GuideCalloutTone.info,
      );
      expect(
        blocks.whereType<GuideTable>().single.rows.single.single.style,
        GuideCellStyle.normal,
      );
      expect(
        blocks.whereType<GuideKeyValues>().single.items.single.reliability,
        GuideReliability.community,
      );
    });

    test('optional collections default to empty', () {
      const String json = '{"id": "x", "title": "X", "edition": "2026-08"}';

      final Guide guide = GuideMapper.parseGuide(json).valueOrNull!;

      expect(guide.sections, isEmpty);
      expect(guide.topics, isEmpty);
      expect(guide.sources, isEmpty);
      expect(guide.estimatedReadMinutes, 0);
      expect(guide.kicker, isNull);
    });
  });

  group('GuideMapper.parseIndex', () {
    test('reads the list of bundled guide identifiers', () {
      final Result<List<String>> result = GuideMapper.parseIndex(
        '{"guides": ["exploration-exobiologie", "artemis-suit"]}',
      );

      expect(
        result.valueOrNull,
        <String>['exploration-exobiologie', 'artemis-suit'],
      );
    });

    test('a broken index yields a ParsingFailure', () {
      expect(
        GuideMapper.parseIndex('{"guides": 42}').failureOrNull,
        isA<ParsingFailure>(),
      );
      expect(
        GuideMapper.parseIndex('nope').failureOrNull,
        isA<ParsingFailure>(),
      );
    });
  });
}
