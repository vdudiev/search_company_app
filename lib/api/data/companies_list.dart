import 'package:json_annotation/json_annotation.dart';
import 'package:search_company/api/data/company_data.dart';

part 'companies_list.g.dart';

/// Список компаний
@JsonSerializable()
class CompaniesList {
  final List<CompanyData> suggestions;

  /// Список компаний
  CompaniesList({
    required this.suggestions,
  });

  factory CompaniesList.fromJson(Map<String, dynamic> json) => _$CompaniesListFromJson(json);
}
