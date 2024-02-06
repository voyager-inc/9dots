import 'package:ninedots/core/di/di_container.dart';
import 'package:ninedots/core/utils/device_configs.dart';

extension NumberExtension on num {
  double get resize => locator<DeviceConfigs>().resizeFitDevice(toDouble());
}