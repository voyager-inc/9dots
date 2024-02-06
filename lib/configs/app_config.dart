import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static Future<String> amplifyConfiguration() async {
    final String environment = dotenv.get("ENV_NAME");
    switch (environment) {
      case "dev":
        return await rootBundle.loadString('lib/configs/amplify_configs/dev/amplifyconfiguration.json');
      case "stg":
        return await rootBundle.loadString('lib/configs/amplify_configs/stg/amplifyconfiguration.json');
      case "prod":
        return await rootBundle.loadString('lib/configs/amplify_configs/prod/amplifyconfiguration.json');
      default:
        return await rootBundle.loadString('lib/configs/amplify_configs/dev/amplifyconfiguration.json');
    }
  }
}