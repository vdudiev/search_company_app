/// Класс для хранения полей диалога ошибок
class ErrorConfig {
  final String title;
  final String subtitle;

  const ErrorConfig({required this.title, required this.subtitle});

  /// Фабрика для ошибки отсутсвия интернета
  factory ErrorConfig.noInternetError() {
    return const ErrorConfig(
      title: 'Ошибка',
      subtitle: 'Отсутствует соединение',
    );
  }

  /// Фабрика для ошибки таймаута
  factory ErrorConfig.timeoutError() {
    return const ErrorConfig(
      title: 'Ошибка',
      subtitle: 'Нет ответа от сервера, повторите попытку позже',
    );
  }

  /// Фабрика для ошибки сервера
  factory ErrorConfig.serverError() {
    return const ErrorConfig(
      title: 'Ошибка Сервера',
      subtitle: 'Временные проблемы с Сервером',
    );
  }

  /// Фабрика для ошибки сервера
  factory ErrorConfig.notFoundException() {
    return const ErrorConfig(
      title: 'Ошибка',
      subtitle: 'Данные не найдены',
    );
  }

  /// Фабрика для других ошибки
  factory ErrorConfig.defaultError() {
    return const ErrorConfig(
      title: 'Ошибка загрузки',
      subtitle: 'Повторите попытку',
    );
  }
}
