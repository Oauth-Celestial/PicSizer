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
          Container(
              alignment: Alignment.center,
              child: Container(
                child: Container(
                  alignment: Alignment.center,
                  child: LottieBuilder.asset("assets/SplashAnimation.json",
                      width: 200,
                      height: 200,
                      repeat: false, onLoaded: (composition) {
                    _controller?.duration = composition.duration;

                    _controller?.forward().whenComplete(() async {
                      Get.to(HomePage());
                      // final prefs = await SharedPreferences.getInstance();

                      // var hasOnboarded = prefs.getBool('hasOnBoarded');
                      // if (hasOnboarded ?? false) {
                      //   RouteManager.instance
                      //       .push(to: DashBoardPage(), context: context);
                      // } else {
                      //   RouteManager.instance
                      //       .push(to: OnboardingPage(), context: context);
                      // }
                    });
                  }),
                ),
              )),
          SizedBox(
            height: 50,
          ),
        ],
      )),
    );
  }
}
