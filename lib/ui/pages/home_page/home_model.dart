import 'package:search_company/api/data/company_data.dart';
import 'package:search_company/domain/repositories/companies_repository.dart';

/// Бизнес-модель экрана списка компаний
class HomeModel {
  List<CompanyData> _companies = [];
  final ICompaniesRepository companiesRepository;

  HomeModel({required this.companiesRepository});

  List<CompanyData> get companies => _companies;

  /// Метод получения Компаний по ИНН
  Future<void> getCompaniesById({required String id}) async {
    var newCompanies = await companiesRepository.getCompaniesById(id: id);
    _companies = newCompanies;
  }
}
