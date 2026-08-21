import '../storage/key_value_store.dart';
import 'line_store.dart';

/// [LineStore] over a [KeyValueStore], for the web build.
///
/// A browser has no file to append to, so the lines go back into one JSON
/// array — the shape the native builds moved away from. It is kept small by
/// circumstance rather than by design: the web target cannot sign in to
/// Frontier at all, so the only journal it ever holds is one the commander
/// pasted in.
class KeyValueLineStore implements LineStore {
  const KeyValueLineStore(this._store, this._key);

  final KeyValueStore _store;
  final String _key;

  @override
  Future<List<String>> readLines() async {
    final List<dynamic>? stored = await _store.readJsonList(_key);
    return stored?.whereType<String>().toList(growable: false) ??
        const <String>[];
  }

  @override
  Future<int> countLines() async => (await readLines()).length;

  @override
  Future<void> writeLines(List<String> lines) =>
      _store.writeJsonList(_key, lines);

  @override
  Future<void> appendLines(List<String> lines) async {
    if (lines.isEmpty) {
      return;
    }
    await writeLines(<String>[...await readLines(), ...lines]);
  }

  @override
  Future<void> clear() => _store.remove(_key);
}
