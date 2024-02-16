import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ninedots/core/core_services/connectivity/notifiers/connectivity_notifier.dart';
import 'package:ninedots/domain/repositories/auth_repository.dart';
import 'package:ninedots/presentation/pages/initializations/splash/presentation/state/splash_state.dart';

class SplashNotifier extends StateNotifier<AsyncValue<SplashState>> {
  final AuthRepository authRepository;
  final ConnectivityService connectivityServiceNotifier;

  SplashNotifier({
    required this.authRepository,
    required this.connectivityServiceNotifier,
  }) : super(const AsyncValue.loading()) {
    _navigation();
  }

  Future<void> _navigation() async {
    if (authRepository.isLocalLogged()) {
      await connectivityServiceNotifier.checkConnection();
      if (connectivityServiceNotifier.state.connected) {
        _authentication();
      }
    } else {
      state = AsyncValue.data(SplashState.data(false));
    }
  }

  Future<void> _authentication() async {
    final response = await authRepository.isSessionLogged();
    response.fold(
      (l) => state = AsyncValue.data(SplashState.failure(l)),
      (r) async {
        if (r == false) {
          final resigninStatus = await _tryResigningin();
          if (resigninStatus == true) {
            await _fetchData();
            state = AsyncValue.data(SplashState.data(true));
          }
        }
      },
    );
  }

  Future<bool> _tryResigningin() async {
    final signedIn = await authRepository.cognitoResignin();
    return signedIn.fold(
      (l) {
        state = AsyncValue.data(SplashState.failure(l));
        return false;
      },
      (r) {
        if (r == false) {
          // appSync.signOut();
          state = AsyncValue.data(SplashState.data(false));
        }
        return r;
      },
    );
  }

  Future<void> _fetchData() async {

  }
}
