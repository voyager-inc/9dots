import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ninedots/core/constants/app_colors.dart';
import 'package:ninedots/core/extensions/extensions.dart';
import 'package:ninedots/core/router/app_route.dart';
import 'package:ninedots/gen/assets.gen.dart';
import 'package:ninedots/presentation/pages/initializations/splash/presentation/providers/splash_provider.dart';
import 'package:ninedots/presentation/pages/initializations/splash/presentation/state/splash_state.dart';

@RoutePage()
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splashScreenState = ref.watch(splashNotifierProvider);
    splashScreenState.when(
        data: (data) async {
          switch (data.state) {
            case SplashProcessState.initial:
            case SplashProcessState.loading:
              break;
            case SplashProcessState.failure:
              break;
            case SplashProcessState.loggedOut:
              context.replaceRoute(const RegistrationRoute());
              break;
            case SplashProcessState.loggedIn:
              break;
          }
        },
        error: (_, __) {},
        loading: (){},
    );
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