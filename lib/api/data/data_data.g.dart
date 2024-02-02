// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataData _$DataDataFromJson(Map<String, dynamic> json) => DataData(
      ogrn: json['ogrn'] as String,
      address: AddressData.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataDataToJson(DataData instance) => <String, dynamic>{
      'address': instance.address,
      'ogrn': instance.ogrn,
    };
