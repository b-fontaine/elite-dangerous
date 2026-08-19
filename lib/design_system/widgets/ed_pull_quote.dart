import 'package:flutter/material.dart';

import '../tokens/ed_colors.dart';
import '../tokens/ed_typography.dart';

/// The guides' `.pq` block: an oversized quote over an orange-to-transparent
/// wash, with a tracked uppercase attribution underneath.
class EdPullQuote extends StatelessWidget {
  const EdPullQuote({required this.quote, this.attribution, super.key});

  final String quote;
  final String? attribution;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(left: BorderSide(color: EdColors.orange, width: 3)),
        gradient: LinearGradient(
          colors: <Color>[EdColors.orangeWash, Colors.transparent],
          stops: <double>[0, 0.75],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(27, 24, 30, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(quote, style: EdTypography.pullQuote),
          if (attribution != null) ...<Widget>[
            const SizedBox(height: 12),
            Text(
              attribution!.toUpperCase(),
              style: EdTypography.tag.copyWith(
                fontSize: 11,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w500,
                color: EdColors.textDim,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
