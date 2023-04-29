import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
  late AnimationController postionAnimationController;
  Animation? sizeAnimation;
  Animation? opacity;
  Animation? positionAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    circleAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    opacityAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    postionAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    positionAnimation =
        Tween<double>(begin: 0.0, end: 0.0).animate(postionAnimationController);

    sizeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(circleAnimationController);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Container(
            //     alignment: Alignment.topCenter,
            //     child: AnimatedBuilder(
            //       animation: postionAnimationController,
            //       builder: ((context, child) {
            //         return Positioned(
            //           top: positionAnimation?.value,
            //           left: 100,
            //           child: ClipOval(
            //             child: Container(
            //               width: 40,
            //               height: 40,
            //               color: Colors.white,
            //             ),
            //           ),
            //         );
            //       }),
            //     )),

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
                        child: Text(
                          "Pic Sizer",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
