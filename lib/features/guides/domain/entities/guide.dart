import 'package:equatable/equatable.dart';

/// Flavour of a [GuideCallout], mirroring the source guides' `.cw / .ci / .ct`.
enum GuideCalloutTone {
  /// "The trap" — red.
  warning,

  /// "Good to know" — cyan.
  info,

  /// "Do this" — green.
  tip,
}

/// How a [GuideTableCell] is rendered: plain, monospace figure, or one of the
/// three verdict colours the guides use to compare options.
enum GuideCellStyle { normal, number, win, lose, mid, strong }

/// Provenance of a [GuideKeyValue], shown as the OFF / COM / EST chips.
enum GuideReliability { official, community, estimate }

/// One authored element of a guide section.
///
/// Sealed so the presentation layer can switch exhaustively: adding a block
/// type is a compile error everywhere it has to be rendered.
sealed class GuideBlock extends Equatable {
  const GuideBlock();

  /// The block's prose, stripped of any structure. Feeds full-text search.
  String get plainText;

  @override
  List<Object?> get props => const <Object?>[];
}

/// Body copy. [isIntro] marks the standfirst paragraph opening a section.
final class GuideParagraph extends GuideBlock {
  const GuideParagraph({required this.text, this.isIntro = false});

  final String text;
  final bool isIntro;

  @override
  String get plainText => text;

  @override
  List<Object?> get props => <Object?>[text, isIntro];
}

/// An in-section heading. Level 3 is a title, level 4 a smaller cyan subtitle.
final class GuideHeading extends GuideBlock {
  const GuideHeading({required this.text, this.level = 3});

  final String text;
  final int level;

  bool get isSubHeading => level >= 4;

  @override
  String get plainText => text;

  @override
  List<Object?> get props => <Object?>[text, level];
}

/// A bulleted or numbered list.
final class GuideList extends GuideBlock {
  const GuideList({required this.items, this.ordered = false});

  final List<String> items;
  final bool ordered;

  @override
  String get plainText => items.join(' ');

  @override
  List<Object?> get props => <Object?>[items, ordered];
}

/// One entry of a [GuideStepsBlock].
final class GuideStepItem extends Equatable {
  const GuideStepItem({required this.text, this.detail});

  final String text;
  final String? detail;

  @override
  List<Object?> get props => <Object?>[text, detail];
}

/// A numbered operational procedure.
final class GuideStepsBlock extends GuideBlock {
  const GuideStepsBlock({required this.items});

  final List<GuideStepItem> items;

  @override
  String get plainText => items
      .map((GuideStepItem item) =>
          item.detail == null ? item.text : '${item.text} ${item.detail}')
      .join(' ');

  @override
  List<Object?> get props => <Object?>[items];
}

/// One cell of a [GuideTable].
final class GuideTableCell extends Equatable {
  const GuideTableCell({
    required this.text,
    this.style = GuideCellStyle.normal,
  });

  final String text;
  final GuideCellStyle style;

  @override
  List<Object?> get props => <Object?>[text, style];
}

/// A comparison table with an optional caption.
final class GuideTable extends GuideBlock {
  const GuideTable({
    required this.headers,
    required this.rows,
    this.caption,
  });

  final List<String> headers;
  final List<List<GuideTableCell>> rows;
  final String? caption;

  @override
  String get plainText {
    final StringBuffer buffer = StringBuffer(headers.join(' '));
    for (final List<GuideTableCell> row in rows) {
      buffer
        ..write(' ')
        ..write(row.map((GuideTableCell cell) => cell.text).join(' '));
    }
    if (caption != null) {
      buffer
        ..write(' ')
        ..write(caption);
    }
    return buffer.toString();
  }

  @override
  List<Object?> get props => <Object?>[headers, rows, caption];
}

/// A tinted advisory box.
final class GuideCallout extends GuideBlock {
  const GuideCallout({required this.tone, required this.text, this.title});

  final GuideCalloutTone tone;
  final String? title;
  final String text;

  @override
  String get plainText => title == null ? text : '$title $text';

  @override
  List<Object?> get props => <Object?>[tone, title, text];
}

/// A pull quote.
final class GuideQuote extends GuideBlock {
  const GuideQuote({required this.text, this.attribution});

  final String text;
  final String? attribution;

  @override
  String get plainText =>
      attribution == null ? text : '$text $attribution';

  @override
  List<Object?> get props => <Object?>[text, attribution];
}

/// The card closing a section with a decision.
final class GuideVerdict extends GuideBlock {
  const GuideVerdict({required this.title, required this.text});

  final String title;
  final String text;

  @override
  String get plainText => '$title $text';

  @override
  List<Object?> get props => <Object?>[title, text];
}

/// One labelled figure of a [GuideKeyValues] block.
final class GuideKeyValue extends Equatable {
  const GuideKeyValue({
    required this.label,
    required this.value,
    this.reliability = GuideReliability.community,
  });

  final String label;
  final String value;
  final GuideReliability reliability;

  @override
  List<Object?> get props => <Object?>[label, value, reliability];
}

/// A compact readout of labelled figures.
final class GuideKeyValues extends GuideBlock {
  const GuideKeyValues({required this.items});

  final List<GuideKeyValue> items;

  @override
  String get plainText => items
      .map((GuideKeyValue item) => '${item.label} ${item.value}')
      .join(' ');

  @override
  List<Object?> get props => <Object?>[items];
}

/// A horizontal rule separating two movements of a section.
final class GuideDivider extends GuideBlock {
  const GuideDivider();

  @override
  String get plainText => '';
}

/// A numbered chapter of a guide.
final class GuideSection extends Equatable {
  const GuideSection({
    required this.id,
    required this.title,
    this.number,
    this.blocks = const <GuideBlock>[],
  });

  final String id;
  final int? number;
  final String title;
  final List<GuideBlock> blocks;

  /// The section's prose, used by search and by the reading-time estimate.
  String get plainText {
    final StringBuffer buffer = StringBuffer(title);
    for (final GuideBlock block in blocks) {
      final String text = block.plainText;
      if (text.isNotEmpty) {
        buffer
          ..write(' ')
          ..write(text);
      }
    }
    return buffer.toString();
  }

  @override
  List<Object?> get props => <Object?>[id, number, title, blocks];
}

/// The library entry of a [Guide]: everything the list page needs, without
/// paying the cost of the whole body.
final class GuideSummary extends Equatable {
  const GuideSummary({
    required this.id,
    required this.title,
    this.deck,
    this.topics = const <String>[],
    this.estimatedReadMinutes = 0,
  });

  final String id;
  final String title;
  final String? deck;
  final List<String> topics;
  final int estimatedReadMinutes;

  @override
  List<Object?> get props =>
      <Object?>[id, title, deck, topics, estimatedReadMinutes];
}

/// A long-form authored guide, bundled with the app as a JSON asset.
final class Guide extends Equatable {
  const Guide({
    required this.id,
    required this.title,
    required this.edition,
    this.kicker,
    this.deck,
    this.byline,
    this.topics = const <String>[],
    this.estimatedReadMinutes = 0,
    this.sections = const <GuideSection>[],
    this.sources = const <String>[],
  });

  final String id;
  final String title;
  final String? kicker;
  final String? deck;
  final String? byline;
  final String edition;
  final List<String> topics;
  final int estimatedReadMinutes;
  final List<GuideSection> sections;
  final List<String> sources;

  GuideSummary get summary => GuideSummary(
        id: id,
        title: title,
        deck: deck,
        topics: topics,
        estimatedReadMinutes: estimatedReadMinutes,
      );

  /// Everything a full-text search should look at: heading matter, topics and
  /// the prose of every block.
  String get searchableText {
    final StringBuffer buffer = StringBuffer(title)
      ..write(' ')
      ..write(topics.join(' '));
    if (deck != null) {
      buffer
        ..write(' ')
        ..write(deck);
    }
    if (kicker != null) {
      buffer
        ..write(' ')
        ..write(kicker);
    }
    for (final GuideSection section in sections) {
      buffer
        ..write(' ')
        ..write(section.plainText);
    }
    return buffer.toString();
  }

  /// Case- and diacritics-insensitive match. A blank [query] matches, so the
  /// caller can bind it straight to a search field.
  bool matches(String query) {
    final String needle = foldForSearch(query);
    if (needle.isEmpty) {
      return true;
    }
    return foldForSearch(searchableText).contains(needle);
  }

  @override
  List<Object?> get props => <Object?>[
        id,
        title,
        kicker,
        deck,
        byline,
        edition,
        topics,
        estimatedReadMinutes,
        sections,
        sources,
      ];
}

const Map<String, String> _diacritics = <String, String>{
  'à': 'a',
  'â': 'a',
  'ä': 'a',
  'á': 'a',
  'ã': 'a',
  'ç': 'c',
  'è': 'e',
  'é': 'e',
  'ê': 'e',
  'ë': 'e',
  'î': 'i',
  'ï': 'i',
  'í': 'i',
  'ô': 'o',
  'ö': 'o',
  'ó': 'o',
  'õ': 'o',
  'ù': 'u',
  'û': 'u',
  'ü': 'u',
  'ú': 'u',
  'ÿ': 'y',
  'ñ': 'n',
  'œ': 'oe',
  'æ': 'ae',
};

/// Lowercases [input], strips French diacritics and trims it, so that
/// "Débuter" and "debuter" are the same needle.
///
/// Deliberately hand-rolled: `intl` would drag a Flutter-adjacent dependency
/// into the domain layer for a twenty-entry table.
String foldForSearch(String input) {
  final StringBuffer buffer = StringBuffer();
  for (final String rune in input.toLowerCase().split('')) {
    buffer.write(_diacritics[rune] ?? rune);
  }
  return buffer.toString().trim();
}
