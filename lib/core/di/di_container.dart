import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ninedots/core/network/api_client.dart';
import 'package:ninedots/core/utils/device_configs.dart';

import 'di_container.config.dart';

final GetIt locator = GetIt.I;

@InjectableInit()
Future<void> configureDependencies() async {
  locator.init();
  locator.registerLazySingleton<DeviceConfigs>(() => DeviceConfigs());
  await locator<ApiClient>().configureAmplify();
}
