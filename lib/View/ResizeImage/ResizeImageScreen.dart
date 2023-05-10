import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picsizer/Constants/AppColors.dart';
import 'package:picsizer/Controller/ResizeImageContoller.dart';
import 'package:picsizer/Model/FileDataModel.dart';
import 'package:picsizer/Services/FileService.dart';
import 'package:picsizer/Services/FontHelper.dart';

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
        title: Text(
          "Resize Image",
          style: FontHelper.regularPaytone(
              TextStyle(fontSize: 18, color: Colors.white)),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.40,
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
                style: FontHelper.mediumNotaSansItalic(
                    TextStyle(fontSize: 18, color: Colors.white)),
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
                    style: FontHelper.mediumNotaSansItalic(
                        TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                  Obx(() {
                    return Text(
                      "${controller.imageWidth.value.toInt()} px",
                      style: FontHelper.mediumNotaSansItalic(
                          TextStyle(fontSize: 15, color: Colors.white)),
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
                    style: FontHelper.mediumNotaSansItalic(
                        TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                  Obx(() {
                    return Text(
                      "${controller.imageHeight.value.toInt()} px",
                      style: FontHelper.mediumNotaSansItalic(
                          TextStyle(fontSize: 15, color: Colors.white)),
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
              child: Obx(() => Container(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: InkWell(
                          onTap: (() {
                            if (controller.isProcessing.value == false) {
                              controller.resizeImage(selectedImage.imageFile);
                            }
                          }),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut,
                            width: controller.isProcessing.value == false
                                ? MediaQuery.of(context).size.width
                                : 50,
                            alignment: Alignment.center,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30)),
                            child: controller.isProcessing.value == false
                                ? AnimatedOpacity(
                                    duration: Duration(seconds: 3),
                                    curve: Curves.easeInOut,
                                    opacity:
                                        controller.isProcessing.value == false
                                            ? 1
                                            : 0,
                                    child: Text(
                                      "Resize",
                                      style: FontHelper.regularPaytone(
                                          TextStyle(
                                              fontSize: 18,
                                              color: Colors.white)),
                                    ),
                                  )
                                : CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                          ),
                        )),
                  )))
        ],
      )),
    );
  }
}
