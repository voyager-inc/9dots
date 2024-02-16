import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ninedots/core/constants/app_colors.dart';
import 'package:ninedots/core/extensions/extensions.dart';
import 'package:ninedots/gen/assets.gen.dart';

class RegistrationAppBar{
  const RegistrationAppBar({
    this.height = 88,
    this.color = AppColors.white90,
    this.leading = true,
    this.elevation = 0,
    this.title = "",
  });

  ///Value before resize
  final double height;
  final Color color;
  final bool leading;
  final double elevation;
  final String title;

  PreferredSizeWidget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height.repoint),
      child: AppBar(
        backgroundColor: color,
        elevation: elevation,
        centerTitle: true,
        titleSpacing: 0,
        title: title.centerALine.regular.s28.c(AppColors.black),
        leadingWidth: 120.repoint,
        leading: leading
          ? SizedBox(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => context.popRoute(),
              child: Row(
                children: [
                  SizedBox(width: 24.repoint),
                  Assets.icons.backButtonIcon.image(
                    width: 32.resize,
                    height: 32.resize,
                  ),
                  "common.backButtonTooltip".tr().ellipsis.regular.s28
                      .c(AppColors.primaryBlue),
                ],
              ),
            ),
          )
          : const SizedBox.shrink(),
      ),
    );
  }
}