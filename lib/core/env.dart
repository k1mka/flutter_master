abstract class Env {
  static const _baseUrlKey = 'baseUrl';
  static const _defaultBaseUrl = 'https://dog.ceo/api';

  static const baseUrl = String.fromEnvironment(_baseUrlKey, defaultValue: _defaultBaseUrl);
}
