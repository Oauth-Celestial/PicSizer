import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picsizer/Model/FileDataModel.dart';
import 'package:picsizer/Services/FileService.dart';

class ResizeImageContoller extends GetxController {
  RxDouble imageWidth = 0.0.obs;
  RxDouble imageHeight = 0.0.obs;
  RxBool isProcessing = false.obs;

  resizeImage(File resizeImage) async {
    isProcessing.value = true;
    File resizedImage = await FileService.shared.resizeImage(
        resizeImage, imageWidth.value.toInt(), imageHeight.value.toInt());
    var decodedImage =
        await decodeImageFromList(resizedImage.readAsBytesSync());

    Future.delayed(Duration(seconds: 3), () {
      isProcessing.value = false;
    });
  }
}
