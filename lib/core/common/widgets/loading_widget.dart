import 'package:flutter/material.dart';
import 'package:ninedots/core/constants/app_colors.dart';
import 'package:ninedots/core/extensions/extensions.dart';
import 'package:ninedots/gen/assets.gen.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.size = 60,
    this.absorbing = false,
  });

  final double size;
  final bool absorbing;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: absorbing,
      child: Container(
        height: double.infinity,
        color: absorbing ? AppColors.grey804 : AppColors.transparent,
        child: Center(
          child: Assets.icons.loading.image(
            width: size.resize,
            height: size.resize,
          ),
        ),
      ),
    );
  }
}