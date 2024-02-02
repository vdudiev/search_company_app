// ignore_for_file: invalid_annotation_target
import 'package:json_annotation/json_annotation.dart';
import 'package:search_company/api/data/address_data.dart';
part 'data_data.g.dart';

/// Data класс для распрасинга адреса в ответе на запрос
@JsonSerializable()
class DataData {
  DataData({required this.ogrn, required this.address});

  /// Полный адрес
  AddressData address;

  /// ОГРН
  String ogrn;

  factory DataData.fromJson(Map<String, dynamic> json) => _$DataDataFromJson(json);
}
