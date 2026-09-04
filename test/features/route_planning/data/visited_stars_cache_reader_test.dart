import 'dart:typed_data';

import 'package:elite_dangerous/features/route_planning/data/datasources/visited_stars_cache_reader.dart';
import 'package:flutter_test/flutter_test.dart';

/// Builds a cache file the way the game writes one.
///
/// Frontier documents none of this; the layout was reconstructed from three
/// independent community readers that agree. Building a file here and reading
/// it back tests the reader, not the format — the format itself can only be
/// confirmed against a real download, which needs a Frontier account.
Uint8List cacheFile({
  required List<int> systems,
  int version = 200,
  int recordSize = 16,
  int headerSize = 48,
  String magic = 'VisitedStars',
  bool sentinel = true,
  int? declaredCount,
}) {
  final int bodySize = systems.length * recordSize + (sentinel ? 8 : 0);
  final Uint8List bytes = Uint8List(headerSize + bodySize);
  final ByteData data = ByteData.sublistView(bytes);

  for (int i = 0; i < magic.length && i < 12; i++) {
    bytes[i] = magic.codeUnitAt(i);
  }
  data.setUint32(0x10, version, Endian.little);
  data.setUint32(0x14, headerSize, Endian.little);
  data.setUint32(0x18, declaredCount ?? systems.length, Endian.little);
  data.setUint32(0x1C, recordSize, Endian.little);

  int offset = headerSize;
  for (final int id in systems) {
    data.setUint32(offset, id & 0xFFFFFFFF, Endian.little);
    data.setUint32(offset + 4, id ~/ 0x100000000, Endian.little);
    if (recordSize >= 16) {
      data.setUint32(offset + 8, 3, Endian.little); // visit count
      data.setUint32(offset + 12, 153199, Endian.little); // day counter
    }
    offset += recordSize;
  }
  if (sentinel) {
    data.setUint32(offset, 0x5AFEC0DE, Endian.little);
    data.setUint32(offset + 4, 0x5AFEC0DE, Endian.little);
  }
  return bytes;
}

void main() {
  // Real SystemAddress values, from routes computed earlier in this feature.
  const int sol = 10477373803;
  const int borfor = 1968982460787;
  const int cpd60 = 2484395297131;

  group('a well-formed cache', () {
    test('yields every system address it holds', () {
      final Set<int>? systems = VisitedStarsCacheReader.read(
        cacheFile(systems: <int>[sol, borfor, cpd60]),
      );

      expect(systems, <int>{sol, borfor, cpd60});
    });

    test('reads ids that need more than 32 bits', () {
      // 1 968 982 460 787 does not fit in 32 bits; a reader that only took the
      // low word would return a different, valid-looking system.
      final Set<int> systems =
          VisitedStarsCacheReader.read(cacheFile(systems: <int>[borfor]))!;

      expect(systems.single, borfor);
      expect(systems.single, greaterThan(0xFFFFFFFF));
    });

    test('stops at the sentinel and ignores whatever follows', () {
      final Uint8List file = cacheFile(systems: <int>[sol]);
      final Uint8List padded = Uint8List(file.length + 32)..setAll(0, file);
      // Garbage after the sentinel, as a truncated or reused buffer would hold.
      for (int i = file.length; i < padded.length; i++) {
        padded[i] = 0xAB;
      }

      expect(VisitedStarsCacheReader.read(padded), <int>{sol});
    });

    test('handles an empty history without calling it corrupt', () {
      expect(VisitedStarsCacheReader.read(cacheFile(systems: <int>[])), isEmpty);
    });
  });

  group('format versions', () {
    test('reads the older 8-byte records', () {
      // Version 100 stored bare ids. Hard-coding a 16-byte stride would read
      // every second id as a visit count and silently halve the history.
      final Set<int>? systems = VisitedStarsCacheReader.read(
        cacheFile(systems: <int>[sol, borfor], version: 100, recordSize: 8),
      );

      expect(systems, <int>{sol, borfor});
    });

    test('refuses a record size it does not know rather than guessing', () {
      expect(
        VisitedStarsCacheReader.read(
          cacheFile(systems: <int>[sol], version: 300, recordSize: 24),
        ),
        isNull,
      );
    });

    test('trusts the header size rather than assuming 48', () {
      final Set<int>? systems = VisitedStarsCacheReader.read(
        cacheFile(systems: <int>[sol], headerSize: 64),
      );

      expect(systems, <int>{sol});
    });
  });

  group('a payload that is not a cache', () {
    test('is refused, not half-read', () {
      // What an error page or a truncated download actually looks like.
      expect(VisitedStarsCacheReader.read(Uint8List(0)), isNull);
      expect(
        VisitedStarsCacheReader.read(Uint8List.fromList(<int>[1, 2, 3])),
        isNull,
      );
      expect(
        VisitedStarsCacheReader.read(cacheFile(systems: <int>[sol], magic: 'NotACache!!!')),
        isNull,
      );
    });

    test('is refused when the header claims to be longer than the file', () {
      final Uint8List file = cacheFile(systems: <int>[sol]);
      ByteData.sublistView(file).setUint32(0x14, 9999, Endian.little);

      expect(VisitedStarsCacheReader.read(file), isNull);
    });
  });

  group('what the reader deliberately does not trust', () {
    test('a record count that disagrees with the file', () {
      // Sources contradict each other on whether that count includes header and
      // footer rows. Believing it would truncate a commander's history with no
      // sign; the sentinel is authoritative instead.
      final Set<int>? systems = VisitedStarsCacheReader.read(
        cacheFile(systems: <int>[sol, borfor, cpd60], declaredCount: 1),
      );

      expect(systems, hasLength(3));
    });

    test('a file with no sentinel still reads to the end', () {
      final Set<int>? systems = VisitedStarsCacheReader.read(
        cacheFile(systems: <int>[sol, borfor], sentinel: false),
      );

      expect(systems, <int>{sol, borfor});
    });

    test('padding zeroes are not systems', () {
      // Address 0 is not a place; a run of zeroes read as a visit would put the
      // galaxy's origin into the commander's history.
      final Set<int>? systems = VisitedStarsCacheReader.read(
        cacheFile(systems: <int>[sol, 0, 0], sentinel: false),
      );

      expect(systems, <int>{sol});
    });
  });
}
