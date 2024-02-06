import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static Future<String> amplifyConfiguration() async {
    final String environment = dotenv.get("ENV_NAME");
    return await rootBundle.loadString('lib/configs/amplify_configs/$environment/amplifyconfiguration.json');
  }
}