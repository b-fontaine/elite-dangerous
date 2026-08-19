/// Port for an append-only body of text lines.
///
/// It exists because the journal outgrew the key/value store. A journal is not
/// a setting: it is tens of thousands of JSON lines that only ever grow, and
/// putting them behind [KeyValueStore] meant one JSON array, re-encoded and
/// rewritten whole on every sync, and held in memory for the life of the
/// process — around 27 MiB at the cap. A line store writes lines.
abstract interface class LineStore {
  /// Every stored line, oldest first. Empty when nothing was ever written.
  Future<List<String>> readLines();

  /// How many lines are stored, without materialising them.
  Future<int> countLines();

  /// Replaces the whole content.
  Future<void> writeLines(List<String> lines);

  /// Adds [lines] at the end, leaving what is already there untouched.
  ///
  /// This is the operation the key/value store could not offer, and the reason
  /// a sync no longer costs a full rewrite.
  Future<void> appendLines(List<String> lines);

  Future<void> clear();
}
