import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ninedots/core/core_services/local_services/hive_service.dart';
import 'package:ninedots/core/di/di_container.dart';

final hiveServiceProvider = Provider<HiveService>((ref) {
  return locator<HiveService>();
});