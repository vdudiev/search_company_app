import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:search_company/domain/exceptions/core_exception.dart';
import 'package:search_company/domain/exceptions/request_exception.dart';

/// Интерсептор обработки ошибок [Dio] клиента.
@immutable
class ServerErrorInterceptor extends Interceptor {
  /// Пространство кодов ошибок сервера.
  static final List<int> _serverErrorCodes = List.generate(100, (index) => index + 500);
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        _throw(const RequestTimeoutException(), err.stackTrace);
      case DioExceptionType.badResponse:
        final errorResponse = err.response;
        final statusCode = errorResponse?.statusCode;
        if (statusCode == 400 || statusCode == 405 || _serverErrorCodes.contains(statusCode)) {
          _throw(const ServerErrorException());
        }
      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
        _throw(const NoInternetException());
      case DioExceptionType.unknown:
        _throw(CoreException.unknown(), err.stackTrace);
    }
  }

  Never _throw(Exception exception, [StackTrace? stackTrace]) =>
      Error.throwWithStackTrace(exception, stackTrace ?? StackTrace.current);
}
