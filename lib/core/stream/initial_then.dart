import 'dart:async';

/// Emits the result of [initial], then everything [updates] produces.
///
/// The obvious spelling is a generator:
///
/// ```dart
/// Stream<T> watch() async* {
///   yield await load();
///   yield* _controller.stream;
/// }
/// ```
///
/// but it drops any event the broadcast controller emits *while* `load()` is
/// still running — there is no listener yet. That window is not theoretical:
/// saving right after opening a screen lands squarely inside it, and the change
/// simply never reaches the UI.
///
/// This subscribes to [updates] synchronously, before awaiting [initial], and
/// buffers what arrives in between.
Stream<T> initialThen<T>(
  Future<T> Function() initial,
  Stream<T> updates,
) {
  late final StreamController<T> controller;
  StreamSubscription<T>? subscription;

  controller = StreamController<T>(
    onListen: () {
      subscription = updates.listen(
        controller.add,
        onError: controller.addError,
      );
      unawaited(
        initial().then(
          (T value) {
            if (!controller.isClosed) {
              controller.add(value);
            }
          },
          onError: (Object error, StackTrace stackTrace) {
            if (!controller.isClosed) {
              controller.addError(error, stackTrace);
            }
          },
        ),
      );
    },
    onCancel: () async {
      await subscription?.cancel();
      subscription = null;
      await controller.close();
    },
  );

  return controller.stream;
}
