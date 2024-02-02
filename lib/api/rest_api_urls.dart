/// Эндпоинты и base url для RestApi
///
/// Так же содержит токен личный токен для авторизации т.к. приложение тестовое и в его спецификации нет
/// возможности регистрации пользователся
class RestApiUrls {
  static const String baseUrl = 'http://suggestions.dadata.ru/suggestions/api/4_1/rs';
  static const String findByIdUrl = '/findById/party';
  static const String token = 'b54d4940580ec1ae40e20ca9f2b04600640f4606';

  const RestApiUrls._();
}
