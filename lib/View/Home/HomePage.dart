import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:picsizer/Controller/HomePageController.dart';
import 'package:picsizer/Constants/AppColors.dart';
import 'package:picsizer/View/Home/Card/HomeTile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController controller = Get.put(HomePageController());
    return Scaffold(
      backgroundColor: blackBackground,
      body: SafeArea(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "What Can\nI help you with ?",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            )
                .animate()
                .slideX(delay: Duration(milliseconds: 600))
                .fadeIn(duration: Duration(milliseconds: 200)),
            SizedBox(
              height: 35,
            ),
            Expanded(
              child: GetBuilder<HomePageController>(
                builder: (controller) {
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                          itemCount: controller.homeOptions.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 5,
                                  crossAxisCount: 2,
                                  childAspectRatio: 3 / 1.65),
                          itemBuilder: (context, index) {
                            return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: HomeTile(
                                      tileData: controller.homeOptions[index],
                                    ))
                                .animate()
                                .fadeIn(
                                    delay: Duration(
                                        milliseconds: 400 * (index + 1)));
                          }),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
