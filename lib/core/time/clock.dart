import 'package:injectable/injectable.dart';

/// Injectable source of "now".
///
/// Token expiry, the 25-day re-authorisation window and the CAPI cooldown all
/// depend on the current time; injecting it keeps those rules testable without
/// sleeping in tests.
abstract interface class Clock {
  DateTime now();
}

@LazySingleton(as: Clock)
class SystemClock implements Clock {
  const SystemClock();

  @override
  DateTime now() => DateTime.now().toUtc();
}
