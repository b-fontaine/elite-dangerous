import 'dart:typed_data';

/// Reads Frontier's `VisitedStarsCache.dat`.
///
/// The format is not documented by Frontier — they declined in 2016, saying the
/// file held "internal starsystem ID numbers which are not particularly
/// suitable for access by third-party tools". That statement has since been
/// overtaken: the eight-byte ids in the current format **are** the
/// `SystemAddress` values the journal writes, and several community tools round
/// trip them. What follows was reconstructed from three independent readers —
/// a Perl one (edastro), a C# one (edsm_scanner) and a Rust one (astronav) —
/// which agree on every field used here.
///
/// Read-only, deliberately. Writing this file back is what Frontier clamped
/// down on, and nothing this app does needs it.
///
/// ```
/// offset  size  meaning
/// 0x00    12    ASCII "VisitedStars"
/// 0x10     4    format version, u32 LE   (100 = 8-byte records,
///                                         200 = 16-byte records)
/// 0x14     4    header size / first record offset (48 in both versions)
/// 0x18     4    record count, u32 LE     — not trusted, see below
/// 0x1C     4    record size, u32 LE      (8 or 16)
/// 0x20    16    commander-specific ids   — never read, never reproduced
/// 0x30   ...    records
///          8    footer sentinel 0x5AFEC0DE5AFEC0DE
/// ```
///
/// Two decisions are worth the words:
///
/// * **The header is believed over the constants.** Version and record size are
///   read rather than assumed, because the format has already changed once —
///   version 100 stored bare ids in eight bytes, version 200 added a visit
///   count and a date. Hard-coding 16 would silently halve a v100 file.
/// * **The record count is not trusted.** Sources disagree on whether it counts
///   data rows only or includes header and footer rows, so parsing stops at the
///   sentinel or at end of file instead. A count that disagrees with reality
///   would truncate a commander's history without any sign.
abstract final class VisitedStarsCacheReader {
  static const List<int> _magic = <int>[
    0x56, 0x69, 0x73, 0x69, 0x74, 0x65, 0x64, 0x53, 0x74, 0x61, 0x72, 0x73,
  ]; // "VisitedStars"

  /// The end-of-file marker, read as a little-endian u64.
  static const int _sentinelLow = 0x5AFEC0DE;

  static const int _headerOffsetVersion = 0x10;
  static const int _headerOffsetHeaderSize = 0x14;
  static const int _headerOffsetRecordSize = 0x1C;
  static const int _minimumHeaderSize = 0x20;

  /// Record sizes this reader knows how to walk.
  static const Set<int> _knownRecordSizes = <int>{8, 16};

  /// Every `SystemAddress` in [bytes].
  ///
  /// Returns null when the payload is not a cache file at all — a truncated
  /// download, an error page, or a format this reader does not recognise.
  /// Null is a displayable state; a half-read history is not.
  static Set<int>? read(Uint8List bytes) {
    if (bytes.length < 48 || !_hasMagic(bytes)) {
      return null;
    }

    final ByteData data = ByteData.sublistView(bytes);
    final int version = data.getUint32(_headerOffsetVersion, Endian.little);
    final int headerSize = data.getUint32(_headerOffsetHeaderSize, Endian.little);
    final int recordSize = data.getUint32(_headerOffsetRecordSize, Endian.little);

    if (version == 0 ||
        !_knownRecordSizes.contains(recordSize) ||
        headerSize < _minimumHeaderSize ||
        headerSize > bytes.length) {
      return null;
    }

    final Set<int> systems = <int>{};
    for (int offset = headerSize;
        offset + recordSize <= bytes.length;
        offset += recordSize) {
      // The sentinel is checked as two 32-bit halves rather than one 64-bit
      // read: `getUint64` throws on the web, where Dart has no 64-bit integer.
      final int low = data.getUint32(offset, Endian.little);
      final int high = data.getUint32(offset + 4, Endian.little);
      if (low == _sentinelLow && high == _sentinelLow) {
        break;
      }

      final int id64 = _readId64(data, offset);
      // Zero is not a system. A run of zeroes is padding, and reading it as a
      // visit would put the galaxy's origin in the commander's history.
      if (id64 != 0) {
        systems.add(id64);
      }
    }

    return systems;
  }

  static bool _hasMagic(Uint8List bytes) {
    for (int i = 0; i < _magic.length; i++) {
      if (bytes[i] != _magic[i]) {
        return false;
      }
    }
    return true;
  }

  /// The id64 at [offset], assembled from two 32-bit halves.
  ///
  /// `getUint64` would be the obvious call and is unavailable on the web, where
  /// Dart integers are doubles. Composing the halves keeps one code path for
  /// every target; a `SystemAddress` fits comfortably under 2^53 in practice —
  /// the largest the game has produced is around 2^45 — so the arithmetic is
  /// exact where `getUint64` would simply have thrown.
  static int _readId64(ByteData data, int offset) {
    final int low = data.getUint32(offset, Endian.little);
    final int high = data.getUint32(offset + 4, Endian.little);
    return high * 0x100000000 + low;
  }
}
