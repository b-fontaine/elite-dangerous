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
}
