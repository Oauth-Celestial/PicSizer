import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:picsizer/Services/NetworkService/ConnectionHelper.dart';

class ConnectivityConatiner extends StatelessWidget {
  final Widget child;
  ConnectivityConatiner({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        child,
        StreamBuilder<NetworkStatus>(
            stream: ConnectionHelper().controller.stream,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return FutureBuilder<ConnectivityResult>(
                    future: Connectivity().checkConnectivity(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data == (ConnectivityResult.none)) {
                          return Container(
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            child: LottieBuilder.asset("assets/wifi.json"),
                          );
                        } else {
                          return Container();
                        }
                      }
                      return Container();
                    });
              }

              return Container(
                child: snapshot.data == NetworkStatus.online
                    ? Visibility(visible: false, child: Container())

                    // Your No Internet widget
                    : Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: LottieBuilder.asset("assets/wifi.json"),
                      ),
              );
            }),
      ],
    );
  }
}
