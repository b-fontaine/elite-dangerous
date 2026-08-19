import 'package:flutter/material.dart';

import '../../../../design_system/design_system.dart';
import '../../domain/entities/guide.dart';

/// The sticky table of contents shown beside a guide on wide screens.
///
/// Mirrors the `.toc` panel of the source HTML guides: a bevelled box with a
/// tracked orange label and zero-padded section numbers.
class GuideToc extends StatelessWidget {
  const GuideToc({
    required this.guide,
    required this.onSelect,
    this.readSectionIds = const <String>{},
    super.key,
  });

  final Guide guide;
  final ValueChanged<String> onSelect;
  final Set<String> readSectionIds;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: EdColors.space,
      child: ListView(
        padding: const EdgeInsets.all(EdSpacing.md),
        children: <Widget>[
          const SizedBox(height: EdSpacing.md),
          Text(
            'Au sommaire'.toUpperCase(),
            style: EdTypography.tag.copyWith(
              fontSize: 10,
              letterSpacing: 3,
              color: EdColors.orangeBright,
            ),
          ),
          const SizedBox(height: EdSpacing.md),
          for (final GuideSection section in guide.sections)
            _TocEntry(
              section: section,
              isRead: readSectionIds.contains(section.id),
              onTap: () => onSelect(section.id),
            ),
        ],
      ),
    );
  }
}

class _TocEntry extends StatelessWidget {
  const _TocEntry({
    required this.section,
    required this.isRead,
    required this.onTap,
  });

  final GuideSection section;
  final bool isRead;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: EdColors.orangeHover,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 26,
              child: Text(
                section.number?.toString().padLeft(2, '0') ?? '··',
                style: EdTypography.numeric.copyWith(
                  fontSize: 11,
                  color: isRead ? EdColors.green : EdColors.textFainter,
                ),
              ),
            ),
            Expanded(
              child: Text(
                section.title,
                style: EdTypography.bodySmall.copyWith(
                  color: isRead ? EdColors.textFaint : EdColors.textBody,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
