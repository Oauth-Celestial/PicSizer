import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:picsizer/Constants/AppColors.dart';
import 'package:picsizer/View/Home/HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  bool hasCompletedAnimation = false;

  goToHome() async {
    await Future.delayed(Duration(seconds: 1), () {
      Get.to(HomePage());
    });
  }

  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBackground,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            fit: StackFit.loose,
            children: [
              Container(
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    width: hasCompletedAnimation ? 0 : 200,
                    height: hasCompletedAnimation ? 0 : 200,
                    duration: Duration(seconds: 1),
                    alignment: Alignment.center,
                    child: LottieBuilder.asset("assets/SplashAnimation.json",
                        repeat: false, onLoaded: (composition) {
                      _controller?.duration = composition.duration;

                      _controller?.forward().whenComplete(() async {
                        setState(() {
                          hasCompletedAnimation = true;
                        });
                        goToHome();
                      });
                    }),
                  )),
              AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: hasCompletedAnimation ? 1 : 0,
                child: Align(
                  child: Text(
                    "Pic Sizer",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
        ],
      )),
    );
  }
}
