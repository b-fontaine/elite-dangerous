import 'package:injectable/injectable.dart';

/// Values baked into the binary at build time by `--dart-define-from-file`.
///
/// Injected rather than read statically because `String.fromEnvironment` is a
/// compile-time constant: a test cannot vary it, but it can substitute this
/// object.
@lazySingleton
class BuildConfig {
  const BuildConfig();

  /// The key `.env` and `.env.template` must use.
  static const String frontierClientIdKey = 'FRONTIER_CLIENT_ID';

  /// The Frontier client id this build ships with, empty when the build was
  /// made without a `.env` — the normal case for a checkout of the sources.
  String get frontierClientId =>
      const String.fromEnvironment(frontierClientIdKey);
}
