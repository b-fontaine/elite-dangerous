import 'package:elite_dangerous/features/journal/data/datasources/journal_file_data_source.dart';
import 'package:flutter_test/flutter_test.dart';

/// Odyssey Update 11 (15 March 2022) changed how Frontier names a journal, and
/// a folder played in for a few years holds both shapes. Ordering them as
/// strings is what everyone tries first, and it hands back a 2022 file as the
/// most recent one.
void main() {
  List<String> newestFirst(List<String> names) =>
      List<String>.of(names)..sort(JournalFileDataSource.compareNewestFirst);

  test('le nom ISO est plus récent que le nom compact, malgré l\'ordre ASCII',
      () {
    // `'Journal.22…'` passe avant `'Journal.2022-…'` en comparaison de
    // chaînes, parce que `'2' > '0'` au troisième caractère.
    const String legacy = 'Journal.220315152335.01.log';
    const String odyssey = 'Journal.2022-03-15T152503.01.log';

    expect(legacy.compareTo(odyssey), greaterThan(0));
    expect(newestFirst(<String>[odyssey, legacy]), <String>[odyssey, legacy]);
  });

  test('les parties d\'une même session se suivent numériquement', () {
    // Un journal se coupe à 500 000 lignes et repart en `part + 1` : la
    // partie 10 vient après la 9, pas avant la 2.
    expect(
      newestFirst(<String>[
        'Journal.2026-08-19T200000.02.log',
        'Journal.2026-08-19T200000.10.log',
        'Journal.2026-08-19T200000.01.log',
        'Journal.2026-08-19T200000.09.log',
      ]),
      <String>[
        'Journal.2026-08-19T200000.10.log',
        'Journal.2026-08-19T200000.09.log',
        'Journal.2026-08-19T200000.02.log',
        'Journal.2026-08-19T200000.01.log',
      ],
    );
  });

  test('une session récente passe devant une partie élevée d\'une ancienne',
      () {
    expect(
      newestFirst(<String>[
        'Journal.2026-08-19T235959.12.log',
        'Journal.2026-08-20T000001.01.log',
      ]),
      <String>[
        'Journal.2026-08-20T000001.01.log',
        'Journal.2026-08-19T235959.12.log',
      ],
    );
  });

  test('un dossier de plusieurs années se range dans le bon ordre', () {
    expect(
      newestFirst(<String>[
        'Journal.180101120000.01.log',
        'Journal.2026-08-19T200000.01.log',
        'Journal.220315152335.02.log',
        'Journal.2022-03-15T152503.01.log',
      ]),
      <String>[
        'Journal.2026-08-19T200000.01.log',
        'Journal.2022-03-15T152503.01.log',
        'Journal.220315152335.02.log',
        'Journal.180101120000.01.log',
      ],
    );
  });

  test('les journaux alpha et beta n\'entrent pas dans l\'historique', () {
    // Ils resteront dans le dossier pour toujours, et les importer
    // ajouterait à la carrière du commandant des ventes, des morts et des
    // premières découvertes faites dans une galaxie qui n'a jamais existé.
    bool accepted(String name) =>
        JournalFileDataSource.journalFilePattern.hasMatch(name);

    expect(accepted('JournalAlpha.210330120000.01.log'), isFalse);
    expect(accepted('JournalBeta.2026-08-19T200000.01.log'), isFalse);
    expect(accepted('Journal.2026-08-19T200000.01.log'), isTrue);
  });

  test('un nom illisible finit en queue plutôt que de déclasser les autres',
      () {
    expect(
      newestFirst(<String>[
        'Journal.corrompu.log',
        'Journal.2020-01-01T000000.01.log',
      ]),
      <String>[
        'Journal.2020-01-01T000000.01.log',
        'Journal.corrompu.log',
      ],
    );
  });

  test('un nom en minuscules ne se hisse pas en tête', () {
    // Le filtre est insensible à la casse : un `t` minuscule survivrait à un
    // découpage qui ne retire que le `T`, et « t » se classe au-dessus de tous
    // les chiffres — le fichier de 15:25 passerait devant celui de 23:59.
    expect(
      newestFirst(<String>[
        'Journal.2022-03-15T235959.01.log',
        'journal.2022-03-15t152503.01.log',
        'Journal.2022-03-15T000001.01.log',
      ]),
      <String>[
        'Journal.2022-03-15T235959.01.log',
        'journal.2022-03-15t152503.01.log',
        'Journal.2022-03-15T000001.01.log',
      ],
    );
  });

  test('un horodatage de longueur inattendue passe pour illisible', () {
    // Plutôt que d'être complété à gauche jusqu'à ressembler à une date, ce
    // qui lui donnerait un rang qu'il ne mérite pas.
    expect(
      newestFirst(<String>[
        'Journal.20220315.01.log',
        'Journal.2020-01-01T000000.01.log',
      ]),
      <String>[
        'Journal.2020-01-01T000000.01.log',
        'Journal.20220315.01.log',
      ],
    );
  });

  test('le filtre laisse dehors les fichiers d\'état voisins', () {
    // Dix fichiers `.json` cohabitent avec les journaux dans le même dossier.
    bool matches(String name) =>
        JournalFileDataSource.journalFilePattern.hasMatch(name);

    expect(matches('Journal.2026-08-19T200000.01.log'), isTrue);
    expect(matches('Journal.220315152335.01.log'), isTrue);
    expect(matches('Status.json'), isFalse);
    expect(matches('ShipLocker.json'), isFalse);
    expect(matches('NavRoute.json'), isFalse);
    expect(matches('Backpack.json'), isFalse);
  });
}
