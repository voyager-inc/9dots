import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ConnectivityStatus { wifi, cellular, offline }

class ConnectivityState {
  final ConnectivityStatus state;

  ConnectivityState({this.state = ConnectivityStatus.offline});
  factory ConnectivityState.fromConnectivityResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityState(state: ConnectivityStatus.cellular);
      case ConnectivityResult.wifi:
        return ConnectivityState(state: ConnectivityStatus.wifi);
      case ConnectivityResult.none:
        return ConnectivityState();
      default:
        return ConnectivityState();
    }
  }

  bool get connected => state != ConnectivityStatus.offline;
}

class ConnectivityService extends StateNotifier<ConnectivityState> {
  ConnectivityService() : super(ConnectivityState()) {
    checkConnection();
    Connectivity().onConnectivityChanged.skip(1).listen(
      (ConnectivityResult result) => checkConnection(givenStatus: result),
    );
  }

  Future<void> checkConnection({ConnectivityResult? givenStatus}) async {
    final ConnectivityResult status = givenStatus
        ?? await Connectivity().checkConnectivity();
    if (status != ConnectivityResult.none) {
      try {
        final result = await InternetAddress.lookup('example.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          state = ConnectivityState.fromConnectivityResult(status);
        } else {
          state = ConnectivityState();
        }
      } on SocketException catch (_) {
        state = ConnectivityState();
      }
    } else {
      state = ConnectivityState();
    }
  }
}
