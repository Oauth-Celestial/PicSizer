import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picsizer/Model/FileDataModel.dart';
import 'package:picsizer/Model/MultiCompressModel.dart';
import 'package:picsizer/Services/FileService.dart';
import 'package:picsizer/View/CompressImage/MultipleImageCompress.dart';

class CompressImageController extends GetxController {
  var imagecompressed = Rxn<FileData>();
  var multiImageCompress = RxList<FileData>();
  RxDouble singleImageCompressionScale = 0.0.obs;
  RxDouble multipleImageCompressionScale = 0.0.obs;
  MultiCompressModel? data;

  compressSingleImage(File selectedImage, int quality) async {
    imagecompressed.value =
        await FileService.shared.compressImage(selectedImage.path, quality);
  }

  compressMultipleImage(BuildContext context) async {
    final imagePicker = ImagePicker();
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();

    if (selectedImages?.length != 0) {
      List<FileData> imageSelected = [];
      int totalSize = 0;
      await Future.forEach(selectedImages!, (element) async {
        FileData data =
            await FileService.shared.getFileData(File(element.path));
        imageSelected.add(data);
        totalSize += await FileService.shared.getFileBytes(element.path);
      });
      String selectionSize =
          await FileService.shared.getFormattedBytes(totalSize, 2);
      data = MultiCompressModel(
          totalSize: selectionSize, userSelectedImages: imageSelected);
      Get.to(MultipleImageCompress(userImages: data!));
    } else {
      SnackBar snackBar = SnackBar(
        content: Text('Please Select a Image!'),
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.purple,
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
