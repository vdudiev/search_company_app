import 'package:dio/dio.dart';
import 'package:search_company/service/http_client_service.dart';
import 'package:search_company/service/server_error_interceptor.dart';
import 'package:search_company/ui/app_di/repositories_di_container.dart';

class AppScope implements IAppScope {
  @override
  RepositoryDiContainer get repository => _repositoryDiContainer;

  /// Зависимости-репозитории.
  late RepositoryDiContainer _repositoryDiContainer;

  /// инициализация di контейнера репозиторий
  Future<void> _initRepositoryDiContainer() async {
    final additionalInterceptors = <Interceptor>[ServerErrorInterceptor()];
    final httpClientService = HttpClientService.create(additionalInterceptors);
    _repositoryDiContainer = RepositoryDiContainer.create(dio: httpClientService.dioClient);
  }

  @override
  Future<void> initApp() async {
    await _initRepositoryDiContainer();
  }
}

/// App dependencies.
abstract class IAppScope {
  /// Зависимости-репозитории.
  RepositoryDiContainer get repository;

  /// Колбэк инициализации приложения.
  Future<void> initApp();
}
