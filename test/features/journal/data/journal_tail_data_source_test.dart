import 'dart:convert';
import 'dart:io';

import 'package:elite_dangerous/features/journal/data/datasources/journal_file_data_source.dart';
import 'package:elite_dangerous/features/journal/data/datasources/journal_tail_data_source.dart';
import 'package:flutter_test/flutter_test.dart';

/// The tail is the one piece of the live view with state of its own — a byte
/// offset — and every way it can go wrong loses or repeats a commander's
/// session. So it is tested against real files being appended to, not against
/// a mock of a file.
void main() {
  late Directory folder;
  late JournalTailDataSource tail;

  setUp(() async {
    folder = await Directory.systemTemp.createTemp('journal_tail_test');
    tail = JournalTailDataSource(const JournalFileDataSource());
  });

  tearDown(() async {
    if (folder.existsSync()) {
      await folder.delete(recursive: true);
    }
  });

  /// One journal line, valid enough for the parser downstream.
  String line(String event, {String stamp = '2026-08-20T12:00:00Z'}) =>
      jsonEncode(<String, dynamic>{'timestamp': stamp, 'event': event});

  File journal(String name) => File('${folder.path}/$name');

  void write(String name, String content) =>
      journal(name).writeAsStringSync(content);

  void append(String name, String content) =>
      journal(name).writeAsStringSync(content, mode: FileMode.append);

  group('ce qui est déjà écrit', () {
    test('le premier passage rend tout le fichier courant', () async {
      write(
        'Journal.2026-08-20T120000.01.log',
        '${line('LoadGame')}\n${line('Location')}\n',
      );

      final JournalTailBatch batch = await tail.readNewLines(folder.path);

      expect(batch.lines, hasLength(2));
      expect(batch.fileName, 'Journal.2026-08-20T120000.01.log');
      // Rien n'a été remplacé : c'est le premier fichier suivi, pas une
      // bascule.
      expect(batch.startedNewFile, isFalse);
    });

    test('un dossier sans journal ne rend rien et ne lève pas', () async {
      final JournalTailBatch batch = await tail.readNewLines(folder.path);

      expect(batch.isEmpty, isTrue);
      expect(batch.fileName, isNull);
    });

    test('un dossier inexistant ne lève pas non plus', () async {
      final JournalTailBatch batch = await tail.readNewLines(
        '${folder.path}/nulle-part',
      );

      expect(batch.isEmpty, isTrue);
    });
  });

  group('ce qui arrive ensuite', () {
    test('le deuxième passage ne rend que les nouvelles lignes', () async {
      write('Journal.2026-08-20T120000.01.log', '${line('LoadGame')}\n');
      await tail.readNewLines(folder.path);

      append('Journal.2026-08-20T120000.01.log', '${line('FSDJump')}\n');
      final JournalTailBatch batch = await tail.readNewLines(folder.path);

      expect(batch.lines, hasLength(1));
      expect(batch.lines.single, contains('FSDJump'));
    });

    test('un passage sans écriture ne rend rien', () async {
      write('Journal.2026-08-20T120000.01.log', '${line('LoadGame')}\n');
      await tail.readNewLines(folder.path);

      expect((await tail.readNewLines(folder.path)).isEmpty, isTrue);
    });

    test('une ligne incomplète attend d\'être terminée', () async {
      // Le cas qui casse tout lecteur naïf : la lecture tombe pendant que le
      // jeu écrit, et la moitié d'un objet JSON ne se parse pas.
      write(
        'Journal.2026-08-20T120000.01.log',
        '${line('LoadGame')}\n{"timestamp":"2026-08-20T12:01:00Z","eve',
      );

      final JournalTailBatch first = await tail.readNewLines(folder.path);
      expect(first.lines, hasLength(1));
      expect(first.lines.single, contains('LoadGame'));

      append('Journal.2026-08-20T120000.01.log', 'nt":"Died"}\n');
      final JournalTailBatch second = await tail.readNewLines(folder.path);

      expect(second.lines, hasLength(1));
      expect(second.lines.single, contains('"event":"Died"'));
    });

    test('un caractère multi-octets n\'est jamais coupé en deux', () async {
      // `é` s'écrit sur deux octets. Couper à l'octet plutôt qu'à la ligne
      // produirait un caractère de remplacement au milieu d'un nom de
      // commandant, et la ligne suivante hériterait de l'octet orphelin.
      final File file = journal('Journal.2026-08-20T120000.01.log');
      final List<int> bytes = <int>[
        ...utf8.encode('${line('LoadGame')}\n'),
        // Premier octet de `é`, sans son second ni le retour à la ligne.
        0xC3,
      ];
      file.writeAsBytesSync(bytes);

      final JournalTailBatch first = await tail.readNewLines(folder.path);
      expect(first.lines, hasLength(1));

      file.writeAsBytesSync(<int>[
        0xA9,
        ...utf8.encode('\n'),
      ], mode: FileMode.append);
      final JournalTailBatch second = await tail.readNewLines(folder.path);

      expect(second.lines.single, 'é');
    });
  });

  group('quand le jeu change de fichier', () {
    test('la fin de l\'ancien est lue avant de basculer', () async {
      write('Journal.2026-08-20T120000.01.log', '${line('LoadGame')}\n');
      await tail.readNewLines(folder.path);

      // Une vente juste avant la fin de session, puis une nouvelle session.
      append(
        'Journal.2026-08-20T120000.01.log',
        '${line('SellOrganicData')}\n',
      );
      write('Journal.2026-08-20T130000.01.log', '${line('Fileheader')}\n');

      final JournalTailBatch batch = await tail.readNewLines(folder.path);

      expect(batch.startedNewFile, isTrue);
      expect(batch.fileName, 'Journal.2026-08-20T130000.01.log');
      expect(
        batch.lines.map((String raw) => raw.contains('SellOrganicData')),
        containsAllInOrder(<bool>[true]),
        reason: 'la vente de fin de session ne doit pas être perdue',
      );
      expect(batch.lines, hasLength(2));
    });

    test('les deux formats de nom sont ordonnés par leur date', () async {
      // Le piège du tri par chaîne : `220315…` trie après `2026-…`, et le
      // suivi se serait accroché à un journal de 2022.
      write('Journal.220315152335.01.log', '${line('LoadGame')}\n');
      write('Journal.2026-08-20T120000.01.log', '${line('Location')}\n');

      final JournalTailBatch batch = await tail.readNewLines(folder.path);

      expect(batch.fileName, 'Journal.2026-08-20T120000.01.log');
      expect(batch.lines.single, contains('Location'));
    });

    test('un fichier qui rétrécit est relu depuis le début', () async {
      write(
        'Journal.2026-08-20T120000.01.log',
        '${line('LoadGame')}\n${line('Location')}\n',
      );
      await tail.readNewLines(folder.path);

      // Une partie restaurée, ou un fichier tronqué par un plantage.
      write('Journal.2026-08-20T120000.01.log', '${line('Fileheader')}\n');
      final JournalTailBatch batch = await tail.readNewLines(folder.path);

      expect(batch.lines, hasLength(1));
      expect(batch.lines.single, contains('Fileheader'));
    });
  });

  test('reset fait tout relire', () async {
    write('Journal.2026-08-20T120000.01.log', '${line('LoadGame')}\n');
    await tail.readNewLines(folder.path);
    expect(tail.followedFile, 'Journal.2026-08-20T120000.01.log');

    tail.reset();
    expect(tail.followedFile, isNull);

    expect((await tail.readNewLines(folder.path)).lines, hasLength(1));
  });
}
