import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:picsizer/Constants/AppColors.dart';
import 'package:picsizer/Model/MultiCompressModel.dart';

import 'package:picsizer/View/CompressImage/ProcessImage.dart';

import '../../Controller/CompressImageController.dart';

class MultipleImageCompress extends StatelessWidget {
  MultiCompressModel userImages;
  MultipleImageCompress({required this.userImages});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    CompressImageController imageController = Get.find();
    return Scaffold(
      backgroundColor: blackBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Preview"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: Container(
            child: GridView.builder(
                itemCount: userImages.userSelectedImages.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 1),
                itemBuilder: (context, index) {
                  File image = userImages.userSelectedImages[index].imageFile;
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.file(image),
                            Container(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 20,
                                  height: 20,
                                  child: Text("${index + 1}"),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ).animate().fadeIn(
                            delay: Duration(
                              milliseconds: 100 * (index + 1),
                            ),
                          ));
                }),
          )),
          SizedBox(
            height: 20,
          ),
          Container(
            width: deviceSize.width,
            height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Text(
                          "Total Images Selected :- ${userImages.userSelectedImages.length}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Text(
                          "Total Selection size :- ${userImages.totalSize}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
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
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Obx(() {
                          return Text(
                            "${imageController.multipleImageCompressionScale.value.toInt()} %",
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
                            value: imageController
                                .multipleImageCompressionScale.value,
                            onChanged: (value) {
                              imageController
                                  .multipleImageCompressionScale.value = value;
                            },
                            min: 0,
                            max: 100,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (() {
                    Navigator.of(context).pop();
                  }),
                  child: Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.blueAccent, width: 2)),
                    child: Text(
                      "Reset",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    imageController.compressMultipleImage(
                        userImages,
                        imageController.multipleImageCompressionScale.value
                            .toInt());
                    Get.to(ProcessImage());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue),
                    child: Text(
                      "Start",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      )),
    );
  }
}
