import 'package:ninedots/core/utils/device_configs.dart';

extension NumberExtension on num {
  double get resize => DeviceConfigs().resizeFitDevice(toDouble());
}