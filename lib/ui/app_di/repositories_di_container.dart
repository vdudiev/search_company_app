import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:search_company/domain/repositories/companies_repository.dart';
import 'package:search_company/domain/repositories/companies_repository_impl.dart';

/// Контейнер зависимостей-репозиториев.
@immutable
class RepositoryDiContainer {
  /// Репозиторий для работы со списком пользователей
  final ICompaniesRepository companiesRepository;

  const RepositoryDiContainer._({required this.companiesRepository});

  factory RepositoryDiContainer.create({
    required Dio dio,
  }) =>
      RepositoryDiContainer._(companiesRepository: CompaniesRepositoryImpl(dio));
}
