import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ninedots/core/constants/app_colors.dart';
import 'package:ninedots/core/extensions/extensions.dart';
import 'package:ninedots/gen/assets.gen.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashScreenBackground,
      body: Center(
        child: SizedBox(
          height: 300.resize,
          width: 350.resize,
          child: Assets.images.logo.image(fit: BoxFit.contain),
        ),
      ),
    );
  }
}