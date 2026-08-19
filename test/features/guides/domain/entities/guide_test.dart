import 'package:elite_dangerous/features/guides/domain/entities/guide.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../guide_fixtures.dart';

void main() {
  group('GuideBlock', () {
    test('every subtype exposes its prose through plainText', () {
      const List<GuideBlock> blocks = <GuideBlock>[
        GuideParagraph(text: 'Un paragraphe'),
        GuideHeading(text: 'Un titre'),
        GuideList(items: <String>['premier', 'second']),
        GuideStepsBlock(
          items: <GuideStepItem>[
            GuideStepItem(text: 'Scanner', detail: 'depuis la soute'),
          ],
        ),
        GuideTable(
          headers: <String>['Vaisseau'],
          rows: <List<GuideTableCell>>[
            <GuideTableCell>[GuideTableCell(text: 'Diamondback')],
          ],
          caption: 'une légende',
        ),
        GuideCallout(
          tone: GuideCalloutTone.info,
          title: 'À savoir',
          text: 'le corps est chaud',
        ),
        GuideQuote(text: 'Fly safe', attribution: 'CMDR'),
        GuideVerdict(title: 'Verdict', text: 'foncer'),
        GuideKeyValues(
          items: <GuideKeyValue>[GuideKeyValue(label: 'Portée', value: '62 al')],
        ),
        GuideDivider(),
      ];

      final String joined =
          blocks.map((GuideBlock block) => block.plainText).join(' ');

      expect(joined, contains('Un paragraphe'));
      expect(joined, contains('premier second'));
      expect(joined, contains('Scanner'));
      expect(joined, contains('depuis la soute'));
      expect(joined, contains('Diamondback'));
      expect(joined, contains('une légende'));
      expect(joined, contains('le corps est chaud'));
      expect(joined, contains('Fly safe'));
      expect(joined, contains('foncer'));
      expect(joined, contains('62 al'));
    });

    test('a divider carries no prose', () {
      expect(const GuideDivider().plainText, isEmpty);
    });

    test('blocks compare by value', () {
      expect(
        const GuideParagraph(text: 'a', isIntro: true),
        const GuideParagraph(text: 'a', isIntro: true),
      );
      expect(
        const GuideParagraph(text: 'a'),
        isNot(const GuideParagraph(text: 'a', isIntro: true)),
      );
      expect(
        const GuideList(items: <String>['a', 'b']),
        const GuideList(items: <String>['a', 'b']),
      );
    });

    test('a paragraph is body copy unless flagged as intro', () {
      expect(const GuideParagraph(text: 'a').isIntro, isFalse);
      expect(const GuideParagraph(text: 'a', isIntro: true).isIntro, isTrue);
    });
  });

  group('GuideSection', () {
    test('exposes the concatenated prose of its blocks', () {
      final GuideSection section = explorationGuide.sections.first;

      expect(section.plainText, contains('Diamondback'));
      expect(section.plainText, contains('Alléger la coque'));
    });

    test('sections compare by value', () {
      expect(explorationGuide.sections.first, explorationGuide.sections.first);
      expect(
        explorationGuide.sections.first,
        isNot(explorationGuide.sections.last),
      );
    });
  });

  group('Guide', () {
    test('derives a summary for the library list', () {
      final GuideSummary summary = explorationGuide.summary;

      expect(summary.id, 'exploration-exobiologie');
      expect(summary.title, 'Explorer la galaxie');
      expect(summary.deck, 'Cartographier, scanner, récolter.');
      expect(summary.topics, <String>['exobiologie', 'exploration']);
      expect(summary.estimatedReadMinutes, 22);
    });

    test('summaries compare by value', () {
      expect(explorationGuide.summary, explorationGuide.summary);
      expect(explorationGuide.summary, isNot(beginnerGuide.summary));
    });

    test('counts its sections and blocks', () {
      expect(explorationGuide.sections, hasLength(2));
      expect(explorationGuide.sections.first.blocks, hasLength(3));
    });

    test('matches on the title', () {
      expect(explorationGuide.matches('galaxie'), isTrue);
    });

    test('matches on a topic', () {
      expect(explorationGuide.matches('exobiologie'), isTrue);
    });

    test('matches on the prose of a block', () {
      expect(explorationGuide.matches('Diamondback'), isTrue);
      expect(explorationGuide.matches('efface tout'), isTrue);
    });

    test('matching ignores case and diacritics', () {
      expect(beginnerGuide.matches('DEBUTANT'), isTrue);
      expect(beginnerGuide.matches('débuter'), isTrue);
    });

    test('does not match unrelated words', () {
      expect(explorationGuide.matches('minage'), isFalse);
    });

    test('an empty or blank query matches everything', () {
      expect(explorationGuide.matches(''), isTrue);
      expect(explorationGuide.matches('   '), isTrue);
    });

    test('guides compare by value', () {
      expect(explorationGuide, isNot(beginnerGuide));
      expect(explorationGuide.summary.id, isNot(beginnerGuide.summary.id));
    });
  });
}
