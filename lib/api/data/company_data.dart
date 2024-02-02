import 'package:json_annotation/json_annotation.dart';
import 'package:search_company/api/data/data_data.dart';
part 'company_data.g.dart';

/// Data-класс для распрасинга адреса в ответе на запрос
@JsonSerializable()
class CompanyData {
  CompanyData({
    required this.unrestrictedValue,
    required this.data,
  });

  /// Полное Название Компании
  @JsonKey(name: 'unrestricted_value')
  String unrestrictedValue;

  /// ОГРН
  @JsonKey(name: 'data')
  DataData data;

  factory CompanyData.fromJson(Map<String, dynamic> json) => _$CompanyDataFromJson(json);
}
