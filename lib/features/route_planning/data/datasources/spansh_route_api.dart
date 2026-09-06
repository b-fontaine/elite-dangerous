import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/spansh_endpoints.dart';

part 'spansh_route_api.g.dart';

/// Spansh's route plotters, and the job endpoint they hand off to.
///
/// Three properties of this contract are not obvious and are not negotiable,
/// because they were observed rather than chosen:
///
/// * **The two plotters take a form, not JSON.** Sending
///   `application/json` is rejected. Their own web client posts a
///   form-encoded body, and so does this.
/// * **They answer `202`, not a route.** The body is
///   `{"job": "...", "status": "queued"}`; the route arrives later, from
///   [results].
/// * **Unknown parameters are dropped in silence.** No error, no warning —
///   they simply vanish from the `parameters` echo in the result. A misspelt
///   field therefore produces a plausible route computed with Spansh's
///   defaults, which is far worse than a failure. `RouteRequestForm` is the
///   single place those names are written, and a test pins them.
///
/// Payloads stay untyped here for the same reason `SpanshApi`'s do: the answers
/// are large and loosely typed, and the mapping is clearer done explicitly in
/// the DTO layer than by a generator.
@RestApi(baseUrl: SpanshEndpoints.baseUrl)
@injectable
abstract class SpanshRouteApi {
  @factoryMethod
  factory SpanshRouteApi(@Named('spansh') Dio dio) = _SpanshRouteApi;

  /// Queues an exobiology route. Returns the job envelope, not the route.
  @POST(SpanshEndpoints.exobiologyRoute)
  @FormUrlEncoded()
  Future<HttpResponse<dynamic>> plotExobiology(
    @Body() Map<String, dynamic> form,
  );

  /// Queues a Road-to-Riches route. Same envelope.
  @POST(SpanshEndpoints.richesRoute)
  @FormUrlEncoded()
  Future<HttpResponse<dynamic>> plotRiches(
    @Body() Map<String, dynamic> form,
  );

  /// Reads a job: still queued, still running, or done with its `result`.
  @GET('/api/results/{job}')
  Future<HttpResponse<dynamic>> results(@Path('job') String jobId);
}
