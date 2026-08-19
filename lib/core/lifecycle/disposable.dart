/// A component that owns something which must be released.
///
/// Repositories exposing a broadcast stream keep a `StreamController` alive for
/// the lifetime of the app. Declaring the release point on the port rather than
/// only on the implementation lets the service locator tear them down — which
/// is what makes `getIt.reset()` safe between tests, and what `injectable`'s
/// `@disposeMethod` needs to see on the registered type.
abstract interface class Disposable {
  Future<void> dispose();
}
