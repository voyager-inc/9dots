// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    RegistrationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegistrationScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    WebRoute.name: (routeData) {
      final args = routeData.argsAs<WebRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WebScreen(
          url: args.url,
          title: args.title,
          canBack: args.canBack,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [RegistrationScreen]
class RegistrationRoute extends PageRouteInfo<void> {
  const RegistrationRoute({List<PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WebScreen]
class WebRoute extends PageRouteInfo<WebRouteArgs> {
  WebRoute({
    required String url,
    required String title,
    bool canBack = true,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          WebRoute.name,
          args: WebRouteArgs(
            url: url,
            title: title,
            canBack: canBack,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'WebRoute';

  static const PageInfo<WebRouteArgs> page = PageInfo<WebRouteArgs>(name);
}

class WebRouteArgs {
  const WebRouteArgs({
    required this.url,
    required this.title,
    this.canBack = true,
    this.key,
  });

  final String url;

  final String title;

  final bool canBack;

  final Key? key;

  @override
  String toString() {
    return 'WebRouteArgs{url: $url, title: $title, canBack: $canBack, key: $key}';
  }
}
