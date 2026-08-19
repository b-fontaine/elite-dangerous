import 'package:flutter/material.dart';

import '../shapes/ed_notched_border.dart';
import '../tokens/ed_colors.dart';
import '../tokens/ed_spacing.dart';
import '../tokens/ed_typography.dart';

/// One entry of an [EdSteps] list.
class EdStep {
  const EdStep({required this.text, this.detail, this.done, this.onToggle});

  final String text;
  final String? detail;

  /// When non-null the step renders as a checklist item; the source guides use
  /// `- [ ]` markers extensively in the operational procedure.
  final bool? done;
  final VoidCallback? onToggle;
}

/// The guides' `.steps` ordered list: a zero-padded orange counter chip on the
/// left, hairline separators between rows.
class EdSteps extends StatelessWidget {
  const EdSteps({required this.steps, this.startAt = 1, super.key});

  final List<EdStep> steps;
  final int startAt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (int i = 0; i < steps.length; i++)
          _EdStepRow(
            step: steps[i],
            index: startAt + i,
            isLast: i == steps.length - 1,
          ),
      ],
    );
  }
}

class _EdStepRow extends StatelessWidget {
  const _EdStepRow({
    required this.step,
    required this.index,
    required this.isLast,
  });

  final EdStep step;
  final int index;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final bool isChecklist = step.done != null;
    final bool done = step.done ?? false;

    final Widget row = Container(
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(bottom: BorderSide(color: EdColors.borderSubtle)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 28,
            height: 22,
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              color: done ? EdColors.green : EdColors.orange,
              shape: const EdNotchedBorder(notch: EdNotch.chip),
            ),
            child: done
                ? const Icon(Icons.check, size: 13, color: EdColors.space)
                : Text(
                    index.toString().padLeft(2, '0'),
                    style: EdTypography.numeric.copyWith(
                      color: EdColors.space,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ),
          const SizedBox(width: EdSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  step.text,
                  style: EdTypography.bodySmall.copyWith(
                    fontSize: 14.5,
                    color: done ? EdColors.textFaint : EdColors.textBody,
                    decoration: done ? TextDecoration.lineThrough : null,
                    decorationColor: EdColors.textFaint,
                  ),
                ),
                if (step.detail != null) ...<Widget>[
                  const SizedBox(height: 4),
                  Text(step.detail!, style: EdTypography.caption),
                ],
              ],
            ),
          ),
        ],
      ),
    );

    if (!isChecklist || step.onToggle == null) {
      return row;
    }
    return Semantics(
      checked: done,
      child: InkWell(
        onTap: step.onToggle,
        hoverColor: EdColors.orangeHover,
        child: row,
      ),
    );
  }
}
