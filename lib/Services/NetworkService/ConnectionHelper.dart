import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum NetworkStatus { online, offline }

// Dependency : connectivity_plus: ^3.0.4
class ConnectionHelper {
  StreamController<NetworkStatus> controller = StreamController();
  static final GlobalKey<NavigatorState> contextKey =
      GlobalKey<NavigatorState>();
  static ConnectionHelper shared = ConnectionHelper();
  OverlayEntry? entry;
  OverlayState? overlayState;
  Widget? noInternetWidget;
  startListner({Widget? noInternetWidget}) {
    Connectivity().onConnectivityChanged.listen((event) {
      print("event changed");

      NetworkStatus status = getConnectionStatus(event);
      overlayState = (contextKey.currentState!.overlay);
      if (status == NetworkStatus.online) {
        _removeNoInternet();
      } else {
        _insertOverlay();
      }

      //controller.add(getConnectionStatus(event));
    });
  }

  _removeNoInternet() {
    entry?.remove();
    overlayState = null;
  }

  _insertOverlay() {
    BuildContext? insertcontext;
    entry = OverlayEntry(builder: (context) {
      insertcontext = context;
      return Container(
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 300,
            height: 300,
            color: Colors.white,
          ),
        ),
      );
    });

    overlayState?.insert(entry!);
  }
}

NetworkStatus getConnectionStatus(ConnectivityResult result) {
  return result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi
      ? NetworkStatus.online
      : NetworkStatus.offline;
}
