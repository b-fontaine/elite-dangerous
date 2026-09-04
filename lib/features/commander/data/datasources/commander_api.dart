import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/frontier_endpoints.dart';

part 'commander_api.g.dart';

/// `GET /profile` on the Companion API.
///
/// Returns the raw map: the payload is too loosely typed to be worth
/// generating a model for, and the DTO layer already parses defensively.
@RestApi(baseUrl: FrontierEndpoints.apiBaseUrl)
@injectable
abstract class CommanderApi {
  @factoryMethod
  factory CommanderApi(@Named('frontierApi') Dio dio) = _CommanderApi;

  /// Returns the payload untyped on purpose: `/profile` is not a stable
  /// schema, and letting the generator build a typed map makes it emit a
  /// `dynamic.fromJson` call that does not compile.
  @GET(FrontierEndpoints.profilePath)
  Future<HttpResponse<dynamic>> profile({
    @Query('language') String language = 'fr',
  });

  /// A zip archive holding the commander's `VisitedStarsCache.dat`.
  ///
  /// Frontier's own description of this endpoint, and the only specification
  /// there is, comes from the CAPI's root listing: *"Download an zip archive
  /// containing the player's VisitedStarsCache.dat file. Status 102 indicates
  /// the file is being generated in the background, try again in a couple of
  /// minutes."*
  ///
  /// Bytes, not JSON — hence the response-type override. And a short timeout on
  /// purpose: `102` is an informational status that most HTTP stacks swallow
  /// while waiting for a final response, so a generation in progress is as
  /// likely to look like a hang as like a status code.
  @GET(FrontierEndpoints.visitedStarsPath)
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> visitedStars();
}
