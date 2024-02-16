import 'package:ninedots/core/utils/app_exception.dart';

enum SplashProcessState {
  initial,
  loading,
  failure,
  loggedOut,
  loggedIn,
}

class SplashState {
  final SplashProcessState state;
  final String message;

  const SplashState({this.state = SplashProcessState.initial, this.message = ""});
  factory SplashState.loading() => const SplashState(state: SplashProcessState.loading);
  factory SplashState.data(bool status) => SplashState(
      state: status
          ? SplashProcessState.loggedIn
          : SplashProcessState.loggedOut,
  );
  factory SplashState.failure(AppException exception) => SplashState(
    state: SplashProcessState.failure,
    message: exception.message ?? "",
  );

  SplashState copyWith({
    SplashProcessState? state,
    String? message,
  }) => SplashState(
    state: state ?? this.state,
    message: message ?? this.message,
  );
}