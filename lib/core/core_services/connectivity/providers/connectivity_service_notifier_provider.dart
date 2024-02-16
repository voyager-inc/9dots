import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ninedots/core/core_services/connectivity/notifiers/connectivity_notifier.dart';
import 'package:ninedots/core/di/di_container.dart';

final connectivityServiceNotifierProvider =
Provider<ConnectivityService>((ref) {
  return locator<ConnectivityService>();
});