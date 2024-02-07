import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ninedots/core/di/di_container.dart';
import 'package:ninedots/core/router/app_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ninedots/presentation/pages/splash/presentation/screens/splash_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env.dev");
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: TextScaler.noScaling,
        ),
        child: child ?? const SplashScreen(),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
    );
  }
}
