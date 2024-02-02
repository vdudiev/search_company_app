import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:search_company/api/data/companies_list.dart';
import 'package:search_company/api/rest_api_urls.dart';

part 'rest_api_api.g.dart';

/// RestApiApi gateway
@RestApi()
abstract class RestApiApi {
  /// Creates RestApiApi gateway
  factory RestApiApi(Dio dio, {String baseUrl}) = _RestApiApi;

  @POST(RestApiUrls.findByIdUrl)
  Future<CompaniesList> getCompanies(
    @Body() Map<String, dynamic> id,
  );
}
