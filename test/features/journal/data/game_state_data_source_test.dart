import 'dart:convert';
import 'dart:io';

import 'package:elite_dangerous/features/journal/data/datasources/game_state_data_source.dart';
import 'package:elite_dangerous/features/journal/domain/entities/game_status.dart';
import 'package:flutter_test/flutter_test.dart';

/// `Status.json` is the only file the game rewrites while the commander is
/// looking at it, so half of what matters here is what happens when a read
/// lands in the middle of a write.
void main() {
  late Directory folder;
  const GameStateDataSource source = GameStateDataSource();

  setUp(() async {
    folder = await Directory.systemTemp.createTemp('game_state_test');
  });

  tearDown(() async {
    if (folder.existsSync()) {
      await folder.delete(recursive: true);
    }
  });

  void write(String name, String content) =>
      File('${folder.path}/$name').writeAsStringSync(content);

  void writeStatus(Map<String, dynamic> json) =>
      write('Status.json', jsonEncode(json));

  group('les drapeaux', () {
    test('un vaisseau amarré est amarré, et rien d\'autre', () async {
      writeStatus(<String, dynamic>{
        'timestamp': '2026-08-20T12:00:00Z',
        'event': 'Status',
        'Flags': StatusFlag.docked |
            StatusFlag.shieldsUp |
            StatusFlag.landingGearDown |
            StatusFlag.inMainShip,
      });

      final GameStatus status = (await source.readStatus(folder.path))!;

      expect(status.docked, isTrue);
      expect(status.landed, isFalse);
      expect(status.onFoot, isFalse);
      expect(status.activity, 'amarré');
    });

    test('à pied sur une planète, le sampler est utilisable', () async {
      writeStatus(<String, dynamic>{
        'timestamp': '2026-08-20T12:00:00Z',
        'event': 'Status',
        'Flags': 0,
        'Flags2': StatusFlag2.onFoot | StatusFlag2.onFootOnPlanet,
        'Latitude': 50.542610,
        'Longitude': 137.415024,
        'Gravity': 0.163701,
        'Temperature': 247.0,
        'Oxygen': 1.0,
        'Health': 1.0,
      });

      final GameStatus status = (await source.readStatus(folder.path))!;

      expect(status.onFoot, isTrue);
      expect(status.canSampleHere, isTrue);
      expect(status.activity, 'à pied');
      expect(status.latitude, closeTo(50.5426, 0.0001));
      expect(status.gravityG, closeTo(0.1637, 0.0001));
      expect(status.temperatureK, 247.0);
    });

    test('à pied dans une station, non', () async {
      // La différence coûte un aller-retour si on l\'ignore : le Genetic
      // Sampler ne fonctionne qu\'à l\'extérieur.
      writeStatus(<String, dynamic>{
        'timestamp': '2026-08-20T12:00:00Z',
        'event': 'Status',
        'Flags': 0,
        'Flags2': StatusFlag2.onFoot | StatusFlag2.onFootInStation,
      });

      final GameStatus status = (await source.readStatus(folder.path))!;

      expect(status.canSampleHere, isFalse);
      expect(status.activity, 'à pied, en station');
    });

    test(
      'un client Horizons n\'écrit pas Flags2, et cela reste lisible',
      () async {
        writeStatus(<String, dynamic>{
          'timestamp': '2026-08-20T12:00:00Z',
          'event': 'Status',
          'Flags': StatusFlag.supercruise | StatusFlag.inMainShip,
        });

        final GameStatus status = (await source.readStatus(folder.path))!;

        expect(status.flags2, 0);
        expect(status.onFoot, isFalse);
        expect(status.activity, 'en supercruise');
      },
    );

    test('le menu principal se reconnaît à ses drapeaux vides', () async {
      writeStatus(<String, dynamic>{
        'timestamp': '2026-08-20T12:00:00Z',
        'event': 'Status',
        'Flags': 0,
      });

      expect((await source.readStatus(folder.path))!.isInMainMenu, isTrue);
    });
  });

  group('les valeurs annexes', () {
    test('la destination et le carburant sont lus', () async {
      writeStatus(<String, dynamic>{
        'timestamp': '2026-08-20T12:00:00Z',
        'event': 'Status',
        'Flags': StatusFlag.supercruise,
        'Fuel': <String, dynamic>{'FuelMain': 24.5, 'FuelReservoir': 0.42},
        'Cargo': 12.0,
        'Balance': 1234567,
        'Destination': <String, dynamic>{
          'System': 2871051298721,
          'Body': 5,
          'Name': 'Hyades Sector DR-V c2-23 A 5',
        },
      });

      final GameStatus status = (await source.readStatus(folder.path))!;

      expect(status.fuelMainT, 24.5);
      expect(status.fuelReservoirT, 0.42);
      expect(status.cargoT, 12);
      expect(status.balanceCr, 1234567);
      expect(status.destination!.systemAddress, 2871051298721);
      expect(status.destination!.name, 'Hyades Sector DR-V c2-23 A 5');
    });

    test(
      'l\'horodatage du fichier est celui du jeu, pas celui de la lecture',
      () async {
        writeStatus(<String, dynamic>{
          'timestamp': '2026-08-20T09:30:00Z',
          'event': 'Status',
          'Flags': StatusFlag.docked,
        });

        final GameStatus status = (await source.readStatus(folder.path))!;

        expect(status.at, DateTime.utc(2026, 8, 20, 9, 30));
      },
    );
  });

  group('une lecture qui tombe au mauvais moment', () {
    test('un fichier absent rend null', () async {
      expect(await source.readStatus(folder.path), isNull);
    });

    test('un fichier vide rend null plutôt que de lever', () async {
      // Le jeu tronque avant de réécrire : ce cas se produit vraiment, et
      // plusieurs fois par minute.
      write('Status.json', '');

      expect(await source.readStatus(folder.path), isNull);
    });

    test('un JSON tronqué rend null', () async {
      write('Status.json', '{"timestamp":"2026-08-20T12:00:00Z","Fla');

      expect(await source.readStatus(folder.path), isNull);
    });
  });

  group('les fichiers annexes sont des lignes de journal', () {
    test('ShipLocker.json ressort tel quel, prêt à fusionner', () async {
      write(
        'ShipLocker.json',
        jsonEncode(<String, dynamic>{
          'timestamp': '2026-08-20T12:00:00Z',
          'event': 'ShipLocker',
          'Items': <Map<String, dynamic>>[
            <String, dynamic>{
              'Name': 'graphene',
              'Name_Localised': 'Graphène',
              'Count': 12,
            },
          ],
        }),
      );

      final List<String> lines = await source.readSidecarLines(folder.path);

      expect(lines, hasLength(1));
      expect(jsonDecode(lines.single), containsPair('event', 'ShipLocker'));
    });

    test('un fichier illisible n\'empêche pas les autres de passer', () async {
      write('ShipLocker.json', '{"event":"ShipLo');
      write(
        'Cargo.json',
        jsonEncode(<String, dynamic>{
          'timestamp': '2026-08-20T12:00:00Z',
          'event': 'Cargo',
          'Count': 0,
        }),
      );

      final List<String> lines = await source.readSidecarLines(folder.path);

      expect(lines, hasLength(1));
      expect(lines.single, contains('"event":"Cargo"'));
    });

    test('un objet sans champ event est écarté', () async {
      // Sans ce filtre la ligne descendrait jusqu'au parser, qui la
      // rejetterait en la comptant comme un événement illisible — un compteur
      // d'erreurs qui grimperait de trois toutes les dix secondes.
      write('Backpack.json', jsonEncode(<String, dynamic>{'Items': <int>[]}));

      expect(await source.readSidecarLines(folder.path), isEmpty);
    });

    test('un dossier sans aucun de ces fichiers ne rend rien', () async {
      expect(await source.readSidecarLines(folder.path), isEmpty);
    });
  });
}
