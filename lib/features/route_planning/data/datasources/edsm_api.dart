import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/edsm_endpoints.dart';

part 'edsm_api.g.dart';

/// EDSM's commander-log endpoints.
///
/// Two things about this API defeat the usual reflexes:
///
/// * **It answers `200 OK` whatever happens.** A missing key, an unknown
///   commander and a real history all come back with the same status; only the
///   `msgnum` in the body tells them apart. A client that trusted the status
///   code would read "no key" as "this commander has never been anywhere" and
///   conclude their entire history was new.
/// * **`showId=1` is not optional here.** Without it EDSM returns a system name
///   and its own internal id; with it, each entry also carries `systemId64` —
///   the game's `SystemAddress`. That parameter is absent from EDSM's own
///   documentation, which has not moved since 2019, and it is the difference
///   between an index keyed on names and one that joins straight onto a route.
@RestApi(baseUrl: EdsmEndpoints.baseUrl)
@injectable
abstract class EdsmApi {
  @factoryMethod
  factory EdsmApi(@Named('edsm') Dio dio) = _EdsmApi;

  /// One window of a commander's flight log, at most a week wide.
  ///
  /// [endDateTime] is the reference: when both bounds are sent EDSM measures
  /// the week backwards from the end, so a backfill walks the end date
  /// backwards rather than sliding a pair.
  @GET(EdsmEndpoints.flightLogs)
  Future<HttpResponse<dynamic>> flightLogs({
    @Query('commanderName') required String commanderName,
    @Query('apiKey') required String apiKey,
    @Query('endDateTime') String? endDateTime,
    @Query('startDateTime') String? startDateTime,
    @Query('showId') int showId = 1,
  });

  /// Where the commander was last seen.
  ///
  /// Cheap, and the reason it exists here: it answers without spending a slot
  /// of the hourly budget on a doomed backfill, so credentials can be checked
  /// before an hour of requests is committed to them.
  @GET(EdsmEndpoints.position)
  Future<HttpResponse<dynamic>> position({
    @Query('commanderName') required String commanderName,
    @Query('apiKey') String? apiKey,
  });
}
