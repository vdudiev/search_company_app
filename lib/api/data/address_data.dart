// ignore_for_file: invalid_annotation_target
import 'package:json_annotation/json_annotation.dart';
part 'address_data.g.dart';

/// Data класс для распрасинга адреса в ответе на запрос
@JsonSerializable()
class AddressData {
  AddressData({
    required this.unrestrictedValue,
  });

  /// Полный адрес без сокращений
  @JsonKey(name: 'unrestricted_value')
  String unrestrictedValue;

  factory AddressData.fromJson(Map<String, dynamic> json) => _$AddressDataFromJson(json);
}
