import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:ninedots/core/constants/app_sizes.dart';

class DeviceConfigs {
  static final DeviceConfigs _instance = DeviceConfigs._init();

  factory DeviceConfigs() {
    return _instance;
  }

  late MediaQueryData appMediaQueryData;

  DeviceConfigs._init() {
    appMediaQueryData = MediaQueryData.fromView(
        WidgetsBinding.instance.platformDispatcher.views.single,
    );
  }

  Size get _size => appMediaQueryData.size;
  Size get _physicalSize => appMediaQueryData.size
      * appMediaQueryData.devicePixelRatio;
  double get width => _size.width;
  double get height => _size.height;
  double get _physicalWidth => _physicalSize.width;
  double get _physicalHeight => _physicalSize.height;
  EdgeInsets get padding => appMediaQueryData.padding;

  double resizeWidth(double value) => (width * value) / Sizes.designSize.width;
  double resizeHeight(double value) => (height * value)
      / Sizes.designSize.height;
  double resizePoint(double value) => (value / 2);
  double resizeFitDevice(double value) => _isSmallDevice
      ? resizeWidth(value)
      : resizePoint(value);

  bool get _iPhone4InchSize => _physicalHeight.toInt() == 568
      || _physicalHeight.toInt() == 568 * 2;
  bool get _iPhone35InchSize => _physicalHeight.toInt() == 480
      || _physicalHeight.toInt() == 480 * 2;
  bool get _iPhoneSmallSize => Platform.isIOS
      && (_iPhone4InchSize || _iPhone35InchSize);
  bool get _androidSmallSize {
    final double ratioSize = _physicalWidth / _physicalHeight;
    return Platform.isAndroid && ratioSize >= 9 / 16 && ratioSize < 1;
  }
  bool get _isSmallDevice => _iPhoneSmallSize || _androidSmallSize;
}
