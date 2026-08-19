import 'package:elite_dangerous/features/guides/domain/entities/guide.dart';

/// A tiny two-section guide exercising every branch the tests care about.
const Guide explorationGuide = Guide(
  id: 'exploration-exobiologie',
  title: 'Explorer la galaxie',
  kicker: 'Elite Dangerous · Édition août 2026',
  deck: 'Cartographier, scanner, récolter.',
  byline: 'PC · Live · Odyssey requis',
  edition: '2026-08',
  topics: <String>['exobiologie', 'exploration'],
  estimatedReadMinutes: 22,
  sections: <GuideSection>[
    GuideSection(
      id: 'choisir-son-vaisseau',
      number: 1,
      title: 'Choisir son vaisseau',
      blocks: <GuideBlock>[
        GuideParagraph(
          text: 'Le **Diamondback Explorer** reste la référence.',
          isIntro: true,
        ),
        GuideHeading(text: 'Portée de saut', level: 4),
        GuideList(items: <String>['Alléger la coque', 'Monter le FSD']),
      ],
    ),
    GuideSection(
      id: 'vendre-ses-donnees',
      number: 2,
      title: 'Vendre ses données',
      blocks: <GuideBlock>[
        GuideCallout(
          tone: GuideCalloutTone.warning,
          title: 'Le piège',
          text: 'Mourir avant de vendre efface tout.',
        ),
        GuideDivider(),
      ],
    ),
  ],
  sources: <String>['Frontier Developments', 'Canonn Research'],
);

/// A second guide, deliberately sharing no vocabulary with [explorationGuide].
const Guide beginnerGuide = Guide(
  id: 'debuter-sans-combat',
  title: 'Débuter sans combat',
  deck: 'Gagner ses premiers millions sans tirer.',
  edition: '2026-08',
  topics: <String>['débutant', 'minage'],
  estimatedReadMinutes: 32,
  sections: <GuideSection>[
    GuideSection(
      id: 'premiers-credits',
      title: 'Premiers crédits',
      blocks: <GuideBlock>[
        GuideParagraph(text: 'Le minage laser paie dès la première heure.'),
      ],
    ),
  ],
  sources: <String>['Inara'],
);
