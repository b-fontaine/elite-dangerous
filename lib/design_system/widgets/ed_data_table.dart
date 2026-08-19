import 'package:flutter/material.dart';

import '../shapes/ed_notched_border.dart';
import '../tokens/ed_colors.dart';
import '../tokens/ed_typography.dart';

/// A single cell of an [EdDataTable].
class EdCell {
  const EdCell(this.text, {this.style, this.tone, this.numeric = false, this.strong = false});

  /// Monospace gold numeric cell — the guides' `td.n`.
  const EdCell.number(this.text)
      : style = null,
        tone = null,
        numeric = true,
        strong = false;

  /// `.win` — a green "this is the good option" cell.
  const EdCell.win(this.text)
      : style = null,
        tone = EdColors.greenBright,
        numeric = false,
        strong = true;

  /// `.lose` — a red "avoid" cell.
  const EdCell.lose(this.text)
      : style = null,
        tone = EdColors.redBright,
        numeric = false,
        strong = true;

  /// `.mid` — an amber "it depends" cell.
  const EdCell.mid(this.text)
      : style = null,
        tone = EdColors.gold,
        numeric = false,
        strong = true;

  final String text;
  final TextStyle? style;
  final Color? tone;
  final bool numeric;
  final bool strong;

  TextStyle resolve() {
    if (style != null) {
      return style!;
    }
    if (numeric) {
      return EdTypography.numeric;
    }
    return EdTypography.bodySmall.copyWith(
      color: tone ?? (strong ? EdColors.textStrong : EdColors.textBody),
      fontWeight: strong ? FontWeight.w600 : null,
    );
  }
}

/// The guides' `.tbl` / `table`: flat panel fill, cyan tracked uppercase
/// headers, hairline row separators, an orange row hover, and horizontal
/// scrolling instead of squeezing columns on a phone.
class EdDataTable extends StatelessWidget {
  const EdDataTable({
    required this.headers,
    required this.rows,
    this.columnWidths,
    this.caption,
    super.key,
  });

  final List<String> headers;
  final List<List<EdCell>> rows;

  /// Minimum width per column, in logical pixels. Defaults to 120 for the
  /// first column and 96 for the rest.
  final List<double>? columnWidths;

  final String? caption;

  double _widthFor(int index) {
    if (columnWidths != null && index < columnWidths!.length) {
      return columnWidths![index];
    }
    return index == 0 ? 150 : 104;
  }

  @override
  Widget build(BuildContext context) {
    final double intrinsicWidth = List<int>.generate(headers.length, (int i) => i)
        .fold<double>(0, (double sum, int i) => sum + _widthFor(i));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double available = constraints.hasBoundedWidth
                ? constraints.maxWidth
                : intrinsicWidth;
            final bool fits = intrinsicWidth <= available;
            final Widget table = SizedBox(
              width: fits ? available : intrinsicWidth,
              child: _TableBody(
                headers: headers,
                rows: rows,
                widthFor: _widthFor,
                stretch: fits,
              ),
            );
            return fits
                ? table
                : Scrollbar(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: table,
                    ),
                  );
          },
        ),
        if (caption != null) ...<Widget>[
          const SizedBox(height: 8),
          Text(caption!, style: EdTypography.caption),
        ],
      ],
    );
  }
}

class _TableBody extends StatelessWidget {
  const _TableBody({
    required this.headers,
    required this.rows,
    required this.widthFor,
    required this.stretch,
  });

  final List<String> headers;
  final List<List<EdCell>> rows;
  final double Function(int index) widthFor;
  final bool stretch;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const ShapeDecoration(
        color: EdColors.panel,
        shape: EdNotchedBorder(
          side: BorderSide(color: EdColors.border),
          notch: 0,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DecoratedBox(
            decoration: const BoxDecoration(
              color: EdColors.panelHeader,
              border: Border(bottom: BorderSide(color: EdColors.borderStrong)),
            ),
            // `IntrinsicHeight` is what lets the cells share a height without
            // asking a Row to stretch into an unbounded parent, which throws.
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  for (int i = 0; i < headers.length; i++)
                    _Cell(
                      width: widthFor(i),
                      stretch: stretch,
                      flex: i == 0 ? 3 : 2,
                      child: Text(
                        headers[i].toUpperCase(),
                        style: EdTypography.tableHeader,
                      ),
                    ),
                ],
              ),
            ),
          ),
          for (int r = 0; r < rows.length; r++)
            _HoverRow(
              isLast: r == rows.length - 1,
              children: <Widget>[
                for (int i = 0; i < rows[r].length; i++)
                  _Cell(
                    width: widthFor(i),
                    stretch: stretch,
                    flex: i == 0 ? 3 : 2,
                    child: Text(rows[r][i].text, style: rows[r][i].resolve()),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  const _Cell({
    required this.width,
    required this.stretch,
    required this.flex,
    required this.child,
  });

  final double width;
  final bool stretch;
  final int flex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Widget padded = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
      child: Align(alignment: Alignment.centerLeft, child: child),
    );
    return stretch
        ? Expanded(flex: flex, child: padded)
        : SizedBox(width: width, child: padded);
  }
}

class _HoverRow extends StatefulWidget {
  const _HoverRow({required this.children, required this.isLast});

  final List<Widget> children;
  final bool isLast;

  @override
  State<_HoverRow> createState() => _HoverRowState();
}

class _HoverRowState extends State<_HoverRow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: _hovered ? EdColors.orangeHover : null,
          border: widget.isLast
              ? null
              : const Border(bottom: BorderSide(color: EdColors.borderSubtle)),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: widget.children,
          ),
        ),
      ),
    );
  }
}
