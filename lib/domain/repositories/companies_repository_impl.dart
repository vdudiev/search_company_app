import 'package:dio/dio.dart';
import 'package:search_company/api/data/company_data.dart';
import 'package:search_company/api/rest_api_api.dart';
import 'package:search_company/domain/repositories/companies_repository.dart';

/// Интерфейс Репозитрия работы с данными компаний
class CompaniesRepositoryImpl implements ICompaniesRepository {
  final RestApiApi _api;
  CompaniesRepositoryImpl(Dio dio) : _api = RestApiApi(dio);

  @override
  Future<List<CompanyData>> getCompaniesById({required String id}) async {
    final response = await _api.getCompanies({'query': id});
    return response.suggestions;
  }
}
