import 'package:flutter_master/core/constants.dart';

abstract class Env {
  static const baseUrl = String.fromEnvironment(Constants.baseUrlKey, defaultValue: Constants.defaultBaseUrl);
}
