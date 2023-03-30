import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picsizer/Constants/AppColors.dart';
import 'package:picsizer/Controller/ResizeImageContoller.dart';
import 'package:picsizer/Model/FileDataModel.dart';

class SingleImageCompressePreview extends StatelessWidget {
  FileData selectedImage;
  SingleImageCompressePreview({required this.selectedImage});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    ResizeImageContoller controller = Get.find<ResizeImageContoller>();
    return Scaffold(
      backgroundColor: blackBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Preview"),
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25, bottom: 10, top: 20),
                child: Text(
                  "Before",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: deviceSize.height * 0.25,
                color: Colors.transparent,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: deviceSize.width * 0.5,
                        child: Image.file(selectedImage.imageFile),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Width : ${selectedImage.imageWidth}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Height :  ${selectedImage.imageHeight}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Image Size :  ${selectedImage.filesize}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ///
              ///

              Padding(
                padding: EdgeInsets.only(left: 25, bottom: 10, top: 40),
                child: Text(
                  "After",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: deviceSize.height * 0.25,
                color: Colors.transparent,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: deviceSize.width * 0.5,
                        child: Image.file(selectedImage.imageFile),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Width : 2000px",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Height : 2000px",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Image Size : 1.3 MB",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Compression Scale",
                        style: TextStyle(color: Colors.white),
                      ),
                      Obx(() {
                        return Text(
                          "${controller.imageWidth.value.toInt()} %",
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
                          max: 100,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: InkWell(
                    onTap: (() {
                      //controller.resizeImage(selectedImage.imageFile);
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
