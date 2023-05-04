import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picsizer/Constants/AppColors.dart';
import 'package:picsizer/Controller/ResizeImageContoller.dart';
import 'package:picsizer/Model/FileDataModel.dart';
import 'package:picsizer/Services/FileService.dart';
import 'package:picsizer/Services/NetworkService/CheckConnectivityContainer.dart';

class ResizeImageScreen extends StatelessWidget {
  FileData selectedImage;
  ResizeImageScreen({required this.selectedImage});

  @override
  Widget build(BuildContext context) {
    ResizeImageContoller controller = Get.find<ResizeImageContoller>();

    return Scaffold(
      backgroundColor: blackBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Resize Image"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ConnectivityConatiner(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.45,
              child: Image.file(selectedImage.imageFile),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Original Dimensions ${selectedImage.imageWidth} X ${selectedImage.imageHeight} ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Image Width",
                      style: TextStyle(color: Colors.white),
                    ),
                    Obx(() {
                      return Text(
                        "${controller.imageWidth.value.toInt()} px",
                        style: TextStyle(color: Colors.white),
                      );
                    })
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Obx(() => Slider(
                        value: controller.imageWidth.value,
                        onChanged: (value) {
                          controller.imageWidth.value = value;
                        },
                        min: 0,
                        max: selectedImage.imageWidth.toDouble(),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Image height",
                      style: TextStyle(color: Colors.white),
                    ),
                    Obx(() {
                      return Text(
                        "${controller.imageHeight.value.toInt()} px",
                        style: TextStyle(color: Colors.white),
                      );
                    })
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Obx(() => Slider(
                        value: controller.imageHeight.value,
                        onChanged: (value) {
                          controller.imageHeight.value = value;
                        },
                        min: 0,
                        max: selectedImage.imageHeight.toDouble(),
                      )),
                ),
              ],
            ),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: InkWell(
                  onTap: (() {
                    controller.resizeImage(selectedImage.imageFile);
                  }),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Resize",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      )),
    );
  }
}
