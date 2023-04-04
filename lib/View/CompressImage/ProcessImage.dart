import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:picsizer/Constants/AppColors.dart';
import 'package:picsizer/Controller/CompressImageController.dart';

class ProcessImage extends StatefulWidget {
  const ProcessImage({super.key});

  @override
  State<ProcessImage> createState() => _ProcessImageState();
}

class _ProcessImageState extends State<ProcessImage>
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
    CompressImageController imageController = Get.find();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: blackBackground,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
            ),
            Container(
                child: Container(
              child: Container(
                child: LottieBuilder.asset("assets/ImageProcessing.json",
                    width: 200,
                    height: 200,
                    repeat: true, onLoaded: (composition) {
                  _controller?.duration = composition.duration;

                  _controller?.forward().whenComplete(() async {
                    // Get.to(HomePage());
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
            Obx(() {
              return Text(
                "${imageController.imageProcessed.value}  processed  of  ${imageController.data?.userSelectedImages.length}  images. ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              );
            })
          ],
        )),
      ),
    );
  }
}
