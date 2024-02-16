import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ninedots/presentation/pages/initializations/policy_terms/presentation/screens/policy_terms_screen.dart';
import 'package:ninedots/presentation/pages/initializations/registration/presentation/screens/registration_screen.dart';
import 'package:ninedots/presentation/pages/initializations/splash/presentation/screens/splash_screen.dart';
part 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    //routes here
    AutoRoute(initial: true, page: SplashRoute.page),
    AutoRoute(page: RegistrationRoute.page),
    AutoRoute(page: WebRoute.page),
  ];
}