// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyData _$CompanyDataFromJson(Map<String, dynamic> json) => CompanyData(
      unrestrictedValue: json['unrestricted_value'] as String,
      data: DataData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompanyDataToJson(CompanyData instance) =>
    <String, dynamic>{
      'unrestricted_value': instance.unrestrictedValue,
      'data': instance.data,
    };
