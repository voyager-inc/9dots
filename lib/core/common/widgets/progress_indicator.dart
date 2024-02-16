import 'package:flutter/material.dart';
import 'package:ninedots/core/constants/app_colors.dart';
import 'package:ninedots/core/di/di_container.dart';
import 'package:ninedots/core/extensions/extensions.dart';
import 'package:ninedots/core/utils/device_configs.dart';

class ProgressIndicator extends StatelessWidget{
  const ProgressIndicator({
    super.key,
    this.percent,
    this.max,
    this.current,
  }) : assert (percent != null || (max != null && current != null));

  final double? percent;
  final int? max;
  final int? current;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 6.resize,
        child: Stack(
          children: [
            Positioned.fill(child: Container()),
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: locator<DeviceConfigs>().width
                  * (percent ?? ((current ?? 1) / (max ?? 1))),
              child: Container(color: AppColors.primaryBlue),
            ),
          ],
        ),
    );
  }
}