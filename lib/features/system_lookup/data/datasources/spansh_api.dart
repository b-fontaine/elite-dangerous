import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/spansh_endpoints.dart';

part 'spansh_api.g.dart';

/// The two documented Spansh reads this app makes.
///
/// Both return the payload untyped, for the same reason `CommanderApi` does:
/// the answers are large, loosely typed and shaped differently from each other
/// — one nests under `system` in `camelCase`, the other under `record` in
/// `snake_case` — and the mapping is better done explicitly in the DTO layer
/// than by a generator.
@RestApi(baseUrl: SpanshEndpoints.baseUrl)
@injectable
abstract class SpanshApi {
  @factoryMethod
  factory SpanshApi(@Named('spansh') Dio dio) = _SpanshApi;

  /// A whole system by its `id64`, bodies included.
  @GET('/api/dump/{id64}')
  Future<HttpResponse<dynamic>> dump(@Path('id64') int id64);

  /// One body by its own `id64`, with its `landmarks`.
  @GET('/api/body/{id64}')
  Future<HttpResponse<dynamic>> body(@Path('id64') int id64);
}
