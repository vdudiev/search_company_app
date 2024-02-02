import 'package:meta/meta.dart';
import 'package:search_company/domain/exceptions/unknown_exception.dart';

/// Ошибка, обработанная в слое бинес-логики приложения.
@immutable
abstract interface class CoreException implements Exception {
  /// Сообщение ошибки.
  final String? message;

  /// @nodoc
  const CoreException({
    this.message,
  });

  /// Неизвестная ошибка.
  factory CoreException.unknown({
    String? message,
  }) =>
      UnknownException(
        message: message,
      );

  @override
  String toString() => 'CoreException(message: "$message")';
}
