import 'dart:core';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ninedots/core/constants/app_colors.dart';
import 'package:ninedots/core/extensions/extensions.dart';
import 'package:ninedots/gen/assets.gen.dart';

enum LeadingType {drawer, top, back, none}

class CustomAppBar{
  const CustomAppBar({
    this.title = "",
    this.titleWidget,
    this.leading,
    this.elevation = 0,
    this.color = AppColors.white90,
    this.actions = const [],
    this.height = 88,
  });

  final String title;
  final Widget? titleWidget;
  final CustomAppBarLeadingButton? leading;
  final double elevation;
  final Color? color;
  final List<Widget> actions;
  final double height;

  PreferredSizeWidget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height.resize),
      child: AppBar(
        flexibleSpace: color != null ? Container(color: color!) : Container(),
        backgroundColor: AppColors.transparent,
        elevation: elevation,
        centerTitle: true,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          children: [
            SizedBox(
              width: 196.resize,
              child: leading,
            ),
            Expanded(
              child: titleWidget
                  ?? title.centerALine.regular.s28.c(AppColors.black),
            ),
            SizedBox(
              width: 196.resize,
              child: Container(
                alignment: Alignment.centerRight,
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 10.resize),
                      Row(children: actions),
                      "".text,
                      SizedBox(width: 24.resize),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBarLeadingButton extends StatefulWidget{
  final String label;
  final Color color;
  final LeadingType leadingType;
  final Function? onPress;

  const CustomAppBarLeadingButton({
    super.key,
    this.label = "",
    this.color = AppColors.darkBrown,
    this.leadingType = LeadingType.drawer,
    this.onPress,
  });

  @override
  State<CustomAppBarLeadingButton> createState() => _CustomAppBarLeadingButtonState();
}

class _CustomAppBarLeadingButtonState extends State<CustomAppBarLeadingButton> {
  bool _isTapDown = false;

  Widget get leadingWidget {
    switch (widget.leadingType) {
      case LeadingType.drawer:
        return Row(
          children: [
            SizedBox(width: 56.resize),
            Icon(
              Icons.menu_outlined,
              color: _isTapDown ? AppColors.grey802 : AppColors.black,
            ),
          ],
        );
      case LeadingType.top:
      case LeadingType.back:
        final String label = widget.label.isNotEmpty
          ? widget.label
          : widget.leadingType == LeadingType.top
            ? "TOP"
            : "registration.btnNext".tr();
        return Row(
          children: [
            SizedBox(width: 24.resize),
            SizedBox(
              width: 32.resize,
              child: Image.asset(
                Assets.icons.backButtonIcon.path,
                color: _isTapDown ? AppColors.grey802 : AppColors.primaryBlue,
              ),
            ),
            Container(
              margin: 40.verticalPadding,
              color: _isTapDown ? AppColors.grey802 : AppColors.primaryBlue,
              child: label.ellipsis.regular.s28,
            ),
          ],
        );
      case LeadingType.none:
        return Row(
          children: [
            SizedBox(width: 56.resize),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: (details) {
        setState(() {
          _isTapDown = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isTapDown = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isTapDown = false;
        });
      },
      onTap: () {
        if (widget.onPress != null) {
          widget.onPress!();
        } else {
          context.popRoute();
        }
      },
      child: leadingWidget,
    );
  }
}