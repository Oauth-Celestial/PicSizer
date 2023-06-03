import 'package:connectivity_watcher/NetworkService/Connectivity_Watcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picsizer/View/Home/HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController circleAnimationController;
  late AnimationController opacityAnimationController;
  Animation? sizeAnimation;
  Animation? opacity;

  @override
  void initState() {
    super.initState();
    ConnectivityWatcher.shared.setup();
    circleAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    opacityAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    sizeAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(circleAnimationController);
    opacity =
        Tween<double>(begin: 0.0, end: 1.0).animate(opacityAnimationController);

    circleAnimationController.forward().whenComplete(() => {
          opacityAnimationController.forward().whenComplete(() {
            Get.to(HomePage(),
                transition: Transition.circularReveal,
                duration: Duration(seconds: 3));
          })
        });
  }

  Widget noInternet() {
    return Container(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Container(
                child: Text(
                  "No Internet Available",
                  style: TextStyle(color: Colors.black12),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
              child: AnimatedBuilder(
                  animation: circleAnimationController,
                  builder: ((context, child) {
                    print(circleAnimationController.value);
                    print(sizeAnimation?.value);
                    return Center(
                        child: ClipOval(
                      child: Container(
                        width: MediaQuery.of(context).size.width *
                            sizeAnimation?.value,
                        height: MediaQuery.of(context).size.width *
                            sizeAnimation?.value,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ));
                  }))),
          Container(
            child: AnimatedBuilder(
              animation: opacityAnimationController,
              builder: ((context, child) {
                print("Opacity controller ${opacity?.value}");
                return Opacity(
                  opacity: opacity?.value,
                  child: Container(
                    child: Center(
                      child: Image.asset("assets/AppIcon.png"),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
