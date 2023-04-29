import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

enum NetworkStatus { online, offline }

// Dependency : connectivity_plus: ^3.0.4
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
