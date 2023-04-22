import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

enum NetworkStatus { online, offline }

class ConnectionHelper {
  StreamController<NetworkStatus> controller = StreamController();

  ConnectionHelper() {
    Connectivity().onConnectivityChanged.listen((event) {
      controller.add(getConnectionStatus(event));
    });
  }
}

NetworkStatus getConnectionStatus(ConnectivityResult result) {
  return result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi
      ? NetworkStatus.online
      : NetworkStatus.offline;
}
