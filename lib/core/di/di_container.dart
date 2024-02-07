import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ninedots/core/network/api_client.dart';
import 'package:ninedots/core/network/api_client_impl.dart';
import 'di_container.config.dart';

final GetIt locator = GetIt.I;

@InjectableInit()
Future<void> configureDependencies() async {
  locator.init();
  await locator<ApiClient>().configureAmplify();
}

@module
abstract class InjectableModule {
  @singleton
  ApiClient get apiClient => ApiClientImpl(amplifyConfig: "");
}