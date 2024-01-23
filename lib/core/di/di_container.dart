import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di_container.config.dart';

final GetIt locator = GetIt.I;

@InjectableInit()
void configureDependencies() {
  locator.init();
}
