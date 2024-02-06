import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ninedots/core/network/api_client.dart';

import 'di_container.config.dart';

final GetIt locator = GetIt.I;

@InjectableInit()
Future<void> configureDependencies() async {
  locator.init();
  await locator<ApiClient>().configureAmplify();
}
