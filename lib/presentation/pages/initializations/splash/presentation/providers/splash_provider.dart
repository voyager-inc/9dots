import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ninedots/core/core_services/connectivity/providers/connectivity_service_notifier_provider.dart';
import 'package:ninedots/domain/providers/auth_repository_providers.dart';
import 'package:ninedots/presentation/pages/initializations/splash/presentation/state/splash_notifier.dart';
import 'package:ninedots/presentation/pages/initializations/splash/presentation/state/splash_state.dart';

final splashNotifierProvider =
StateNotifierProvider<SplashNotifier, AsyncValue<SplashState>>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  final connectivityServiceNotifier = ref.watch(connectivityServiceNotifierProvider);
  return SplashNotifier(
    authRepository: repository,
    connectivityServiceNotifier: connectivityServiceNotifier,
  );
});