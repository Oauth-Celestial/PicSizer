import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picsizer/Constants/AppColors.dart';
import 'package:picsizer/Controller/CompressImageController.dart';
import 'package:picsizer/Controller/SelectImageController.dart';
import 'package:picsizer/Services/NetworkService/CheckConnectivityContainer.dart';
import 'package:picsizer/View/CompressImage/MultipleImageCompress.dart';

class CompressImage extends StatelessWidget {
  const CompressImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Compress Image"),
        centerTitle: true,
      ),
      backgroundColor: blackBackground,
      body: SafeArea(
          child: ConnectivityConatiner(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  SelectImageContoller controller =
                      Get.find<SelectImageContoller>();
                  controller.selectSingleImage(context, "single compress");
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 50,
                  child: Text(
                    "Single Image",
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  // SelectImageContoller controller = Get.find();
                  // controller.selectSingleImage(context, "single compress");
                  // Get.to(MultipleImageCompress());

                  CompressImageController controller = Get.find();
                  controller.selectMultipleImage(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 50,
                  child: Text(
                    "Multiple Image",
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
