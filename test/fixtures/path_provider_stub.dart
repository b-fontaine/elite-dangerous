import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// Points `path_provider` at a real temporary directory.
///
/// The journal moved out of the preferences and into a file, so any test that
/// resolves the real dependency graph now reaches the platform channel — which
/// does not exist under `flutter_test`. Giving it a genuine directory rather
/// than an in-memory double keeps the file store's own behaviour under test:
/// the atomic rename, the append, the streaming read.
class _TempPathProvider extends PathProviderPlatform
    with MockPlatformInterfaceMixin {
  _TempPathProvider(this.root);

  final Directory root;

  @override
  Future<String?> getApplicationSupportPath() async => root.path;

  @override
  Future<String?> getApplicationDocumentsPath() async => root.path;

  @override
  Future<String?> getTemporaryPath() async => root.path;
}

/// Installs the stub for the current test file and removes the directory
/// afterwards. Call once, at the top of `main()`.
void usePathProviderStub() {
  late Directory root;

  setUp(() {
    root = Directory.systemTemp.createTempSync('ed_test_');
    PathProviderPlatform.instance = _TempPathProvider(root);
  });

  tearDown(() {
    if (root.existsSync()) {
      root.deleteSync(recursive: true);
    }
  });
}
