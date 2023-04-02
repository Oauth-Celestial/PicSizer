import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picsizer/Constants/AppColors.dart';
import 'package:picsizer/Controller/CompressImageController.dart';
import 'package:picsizer/Controller/ResizeImageContoller.dart';
import 'package:picsizer/Model/FileDataModel.dart';
import 'package:picsizer/Services/FileService.dart';

class SingleImageCompressePreview extends StatelessWidget {
  FileData selectedImage;
  SingleImageCompressePreview({required this.selectedImage});

  @override
  Widget build(BuildContext context) {
    CompressImageController imageController = Get.find();
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
              Obx(() => Container(
                    height: deviceSize.height * 0.25,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: deviceSize.width * 0.5,
                            child: imageController
                                        .imagecompressed.value?.imageFile ==
                                    null
                                ? Image.file(selectedImage.imageFile)
                                : Image.file(imageController
                                    .imagecompressed.value!.imageFile),
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
                                Text(
                                    "Image Size : ${imageController.imagecompressed.value?.imageFile == null ? selectedImage.filesize! : imageController.imagecompressed.value!.filesize}",
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
                  )),
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
                          "${imageController.singleImageCompressionScale.value.toInt()} %",
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
                            imageController.singleImageCompressionScale.value =
                                value;
                          },
                          onChangeEnd: (value) {
                            imageController.compressSingleImage(
                                selectedImage.imageFile, 100 - value.toInt());
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
                    onTap: (() async {
                      if (imageController.imagecompressed.value?.imageFile !=
                          null) {
                        FileService.shared.saveFile(
                            imageController.imagecompressed.value!.imageFile);
                      } else {
                        FileService.shared.saveFile(selectedImage.imageFile);
                      }

                      SnackBar snackBar = SnackBar(
                        content: Text('Filed Saved'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "Save",
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
