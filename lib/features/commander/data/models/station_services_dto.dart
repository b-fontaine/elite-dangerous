import '../../domain/entities/station_services.dart';
import 'json_readers.dart';

/// Reads `lastStarport` from `GET /profile`.
abstract final class StationServicesDto {
  /// Frontier marks each service `ok`, `unavailable` or `private`. Only the
  /// first means the commander can actually use it.
  static const String availableMarker = 'ok';

  static StationServices fromJson(
    Object? starport, {
    Object? lastSystem,
  }) {
    final Map<String, dynamic> port = readMap(starport);
    if (port.isEmpty) {
      return const StationServices.none();
    }
    final Map<String, dynamic> services = readMap(port['services']);
    return StationServices(
      stationName: readString(port['name']),
      services: <String>{
        for (final MapEntry<String, dynamic> entry in services.entries)
          if (entry.value == availableMarker) entry.key,
      },
      systemName: readString(readMap(lastSystem)['name']),
      minorFaction: readString(port['minorfaction']),
    );
  }
}
