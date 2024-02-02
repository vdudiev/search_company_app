import 'package:search_company/domain/exceptions/core_exception.dart';

/// Неизвестная ошибка, произошедшая в момент работы МП.
final class UnknownException implements CoreException {
  @override
  final String? message;

  /// @nodoc
  const UnknownException({
    this.message,
  });
}
