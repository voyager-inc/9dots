import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:ninedots/core/core_services/connectivity/notifiers/connectivity_notifier.dart';
import 'package:ninedots/core/core_services/local_services/hive_service.dart';
import 'package:ninedots/core/network/api_client.dart';
import 'package:ninedots/core/utils/device_configs.dart';

import 'di_container.config.dart';

final GetIt locator = GetIt.I;

@InjectableInit()
Future<void> configureDependencies() async {
  locator.init();
  await Hive.initFlutter();
  final hiveBox = await Hive.openBox("appBox");
  locator.registerLazySingleton<HiveService>(() => HiveService(box: hiveBox));
  locator.registerLazySingleton<DeviceConfigs>(() => DeviceConfigs());
  await locator<ApiClient>().configureAmplify();
  locator.registerLazySingleton<ConnectivityService>(() => ConnectivityService());
}
