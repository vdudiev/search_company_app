// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompaniesList _$CompaniesListFromJson(Map<String, dynamic> json) =>
    CompaniesList(
      suggestions: (json['suggestions'] as List<dynamic>)
          .map((e) => CompanyData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompaniesListToJson(CompaniesList instance) =>
    <String, dynamic>{
      'suggestions': instance.suggestions,
    };
