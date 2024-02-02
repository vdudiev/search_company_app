import 'package:search_company/api/data/company_data.dart';

/// Интерфейс Репозитрия работы с данными компаний
abstract interface class ICompaniesRepository {
  /// метод получения компаний по ИНН
  Future<List<CompanyData>> getCompaniesById({required String id});
}
