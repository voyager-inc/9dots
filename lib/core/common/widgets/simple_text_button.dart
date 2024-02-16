import 'package:flutter/material.dart';
import 'package:ninedots/core/constants/app_colors.dart';
import 'package:ninedots/core/extensions/extensions.dart';

class SimpleTextButton extends StatelessWidget {
  const SimpleTextButton({
    super.key,
    required this.label,
    this.enable = true,
    required this.onPress,
  });

  final String label;
  final bool enable;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98.resize,
      width: double.infinity,
      margin: [24, 0, 24, 56].padding,
      child: TextButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(2),
          shadowColor: MaterialStateProperty.all(AppColors.grey),
          backgroundColor: MaterialStateProperty.all(AppColors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.resize),
              ),
          ),
        ),
        onPressed: () {
          if (enable) {
            onPress();
          }
        },
        child: label.text.s30.c(
          enable
            ? AppColors.primaryBlue
            : AppColors.grey,
        ),
      ),
    );
  }
}