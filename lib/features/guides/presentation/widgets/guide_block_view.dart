import 'package:flutter/material.dart';

import '../../../../design_system/design_system.dart';
import '../../domain/entities/guide.dart';
import 'guide_rich_text.dart';

/// Renders one authored block with the matching design-system component.
///
/// The mapping is one-to-one with the source HTML guides: their `.cw/.ci/.ct`
/// callouts, `.pq` pull quotes, `.verdict` cards, `.steps` lists and tables all
/// have a component here, so the app and the guides read as one product.
class GuideBlockView extends StatelessWidget {
  const GuideBlockView(this.block, {super.key});

  final GuideBlock block;

  @override
  Widget build(BuildContext context) {
    return switch (block) {
      GuideParagraph(:final String text, :final bool isIntro) =>
        _paragraph(text, isIntro: isIntro),
      GuideHeading(:final String text, :final int level) =>
        _heading(text, level),
      GuideList(:final List<String> items, :final bool ordered) =>
        _list(items, ordered: ordered),
      GuideStepsBlock(:final List<GuideStepItem> items) => EdSteps(
          steps: <EdStep>[
            for (final GuideStepItem item in items)
              EdStep(text: item.text, detail: item.detail),
          ],
        ),
      GuideTable(
        :final List<String> headers,
        :final List<List<GuideTableCell>> rows,
        :final String? caption,
      ) =>
        EdDataTable(
          headers: headers,
          caption: caption,
          rows: <List<EdCell>>[
            for (final List<GuideTableCell> row in rows)
              <EdCell>[for (final GuideTableCell cell in row) _cell(cell)],
          ],
        ),
      GuideCallout(
        :final GuideCalloutTone tone,
        :final String? title,
        :final String text,
      ) =>
        EdCallout(
          tone: _tone(tone),
          title: title,
          child: GuideRichText(text, style: EdTypography.bodySmall),
        ),
      GuideQuote(:final String text, :final String? attribution) =>
        EdPullQuote(quote: text, attribution: attribution),
      GuideVerdict(:final String title, :final String text) => EdVerdict(
          title: title,
          child: GuideRichText(
            text,
            style: EdTypography.bodySmall.copyWith(fontSize: 14.5),
          ),
        ),
      GuideKeyValues(:final List<GuideKeyValue> items) => _keyValues(items),
      GuideDivider() => const Padding(
          padding: EdgeInsets.symmetric(vertical: EdSpacing.md),
          child: Divider(),
        ),
    };
  }

  Widget _paragraph(String text, {required bool isIntro}) {
    if (!isIntro) {
      return GuideRichText(text, style: EdTypography.body);
    }
    return Container(
      decoration: const BoxDecoration(
        border: Border(left: BorderSide(color: EdColors.orange, width: 2)),
      ),
      padding: const EdgeInsets.only(left: EdSpacing.lg),
      child: GuideRichText(text, style: EdTypography.intro),
    );
  }

  Widget _heading(String text, int level) => level >= 4
      ? EdSubHeader(text)
      : Text(text, style: EdTypography.titleLarge);

  Widget _list(List<String> items, {required bool ordered}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (int i = 0; i < items.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 9),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: ordered ? 26 : 18,
                  child: Text(
                    ordered ? '${i + 1}.' : '•',
                    style: EdTypography.bodySmall
                        .copyWith(color: EdColors.orangeBright),
                  ),
                ),
                Expanded(
                  child: GuideRichText(
                    items[i],
                    style: EdTypography.bodySmall.copyWith(height: 1.6),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _keyValues(List<GuideKeyValue> items) {
    return EdPanel(
      padding: const EdgeInsets.symmetric(
        horizontal: EdSpacing.md,
        vertical: EdSpacing.xs,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          for (final GuideKeyValue item in items)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 9),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      item.label.toUpperCase(),
                      style: EdTypography.tag.copyWith(
                        fontSize: 10,
                        letterSpacing: 1.6,
                        color: EdColors.textFainter,
                      ),
                    ),
                  ),
                  const SizedBox(width: EdSpacing.sm),
                  Text(item.value, style: EdTypography.numeric),
                  const SizedBox(width: EdSpacing.xs),
                  EdTag.reliability(_reliability(item.reliability)),
                ],
              ),
            ),
        ],
      ),
    );
  }

  static EdCalloutTone _tone(GuideCalloutTone tone) => switch (tone) {
        GuideCalloutTone.warning => EdCalloutTone.warning,
        GuideCalloutTone.info => EdCalloutTone.info,
        GuideCalloutTone.tip => EdCalloutTone.tip,
      };

  static EdSourceReliability _reliability(GuideReliability reliability) =>
      switch (reliability) {
        GuideReliability.official => EdSourceReliability.official,
        GuideReliability.community => EdSourceReliability.community,
        GuideReliability.estimate => EdSourceReliability.estimate,
      };

  static EdCell _cell(GuideTableCell cell) => switch (cell.style) {
        GuideCellStyle.number => EdCell.number(cell.text),
        GuideCellStyle.win => EdCell.win(cell.text),
        GuideCellStyle.lose => EdCell.lose(cell.text),
        GuideCellStyle.mid => EdCell.mid(cell.text),
        GuideCellStyle.strong => EdCell(cell.text, strong: true),
        GuideCellStyle.normal => EdCell(cell.text),
      };
}
