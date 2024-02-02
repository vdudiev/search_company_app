import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:search_company/api/rest_api_urls.dart';

/// Таймаут в минутах.
const _timeoutMinutes = 5;

/// Клиент создания объектов выполнения HTTP запросов.
@immutable
class HttpClientService {
  /// Клиент RestAPI запросов.
  final Dio dioClient;

  const HttpClientService._({
    required this.dioClient,
  });

  /// Создаёт класс-обёртку, содержащую клиент запросов.
  ///
  /// Опционально можно передать список интерсепторов запросов [additionalInterceptors].
  factory HttpClientService.create(Iterable<Interceptor>? additionalInterceptors) {
    const timeout = Duration(seconds: _timeoutMinutes * 60);
    final dio = Dio();
    dio.options
      ..baseUrl = RestApiUrls.baseUrl
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout
      ..headers['Authorization'] = 'Token ${RestApiUrls.token}';

    if (additionalInterceptors != null) dio.interceptors.addAll(additionalInterceptors);

    /// Интерсептор для логов запросов
    dio.interceptors.add(
      AwesomeDioInterceptor(
        // Disabling headers and timeout would minimize the logging output.
        // Optional, defaults to true
        logRequestTimeout: false,
        logRequestHeaders: false,
        logResponseHeaders: false,

        // Optional, defaults to the 'log' function in the 'dart:developer' package.
        logger: debugPrint,
      ),
    );

    return HttpClientService._(dioClient: dio);
  }
}
