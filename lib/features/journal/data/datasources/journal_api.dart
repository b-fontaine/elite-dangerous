import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/frontier_endpoints.dart';

part 'journal_api.g.dart';

/// `GET /journal/{year}/{month}/{day}` on the Companion API.
///
/// The body is **JSON-lines**, not a JSON document, so the response is taken as
/// plain text. Frontier also uses the status code semantically: `204` means the
/// commander did not play that day and `206` that the journal is incomplete —
/// neither is an error, so both must reach the caller.
@RestApi(baseUrl: FrontierEndpoints.apiBaseUrl)
@injectable
abstract class JournalApi {
  @factoryMethod
  factory JournalApi(@Named('frontierApi') Dio dio) = _JournalApi;

  @GET('/journal/{year}/{month}/{day}')
  @DioResponseType(ResponseType.plain)
  Future<HttpResponse<String>> journalForDay(
    @Path('year') String year,
    @Path('month') String month,
    @Path('day') String day,
  );
}
