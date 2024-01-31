import 'package:auto_route/auto_route.dart';

import '../../presentation/pages/splash/presentation/screens/splash_screen.dart';
part 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    //routes here
    AutoRoute(initial: true, page: SplashRoute.page),
  ];
}