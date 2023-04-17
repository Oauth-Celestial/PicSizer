import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:picsizer/Constants/AppColors.dart';
import 'package:picsizer/View/CompressImage/ResultPage.dart';

class HappyAnimation extends StatefulWidget {
  const HappyAnimation({super.key});

  @override
  State<HappyAnimation> createState() => _HappyAnimationState();
}

class _HappyAnimationState extends State<HappyAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBackground,
      body: SafeArea(
          child: Container(
        child: Container(
          child: Center(
            child: LottieBuilder.asset(
              "assets/happy.json",
              repeat: false,
              onLoaded: (compostion) {
                controller.duration = compostion.duration;
                controller.forward().whenComplete(() {
                  Get.to(ImageCompressResult());
                });
              },
            ),
          ),
        ),
      )),
    );
  }
}
