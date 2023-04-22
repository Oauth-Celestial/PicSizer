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
              return Container(
                child: snapshot.data == NetworkStatus.online
                    ? Visibility(visible: false, child: Container())
                    : Align(
                        alignment: Alignment.center,
                        child: LottieBuilder.asset("assets/wifi.json"),
                      ),
              );
            }),
      ],
    );
  }
}
