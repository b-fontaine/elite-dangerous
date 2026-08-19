import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/frontier_endpoints.dart';

part 'diagnostics_api.g.dart';

/// The same two endpoints the app already calls, asked for as plain text.
///
/// It exists next to `CommanderApi` rather than reusing it because the need is
/// the opposite one: that client hands back a decoded map, and re-encoding a
/// map is no longer what Frontier sent. A capture that has been through a JSON
/// round-trip cannot answer "is this key really absent?".
@RestApi(baseUrl: FrontierEndpoints.apiBaseUrl)
@injectable
abstract class DiagnosticsApi {
  @factoryMethod
  factory DiagnosticsApi(@Named('frontierApi') Dio dio) = _DiagnosticsApi;

  @GET(FrontierEndpoints.profilePath)
  @DioResponseType(ResponseType.plain)
  Future<HttpResponse<String>> profile();

  @GET('/journal/{year}/{month}/{day}')
  @DioResponseType(ResponseType.plain)
  Future<HttpResponse<String>> journalForDay(
    @Path('year') String year,
    @Path('month') String month,
    @Path('day') String day,
  );
}
