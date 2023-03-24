import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picsizer/Model/FileDataModel.dart';
import 'package:picsizer/Services/FileService.dart';
import 'package:picsizer/View/ResizeImage/ResizeImageScreen.dart';

class SelectImageContoller extends GetxController {
  List<XFile> allSelectedImage = [];
  List<FileData> userSelectedImages = [];
  FileData? selectedImage;
  bool hasSelectedImage = false;

  selectMultipleImage() async {
    final imagePicker = ImagePicker();
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      allSelectedImage.addAll(selectedImages);
      userSelectedImages = [];
      List<Future> getFileSize = [];
      for (int i = 0; i < allSelectedImage.length; i++) {
        getFileSize
            .add(FileService.shared.getFileSize(allSelectedImage[i].path, 1));
      }
      List<dynamic> getFileSizeResponse = await Future.wait(getFileSize);

      // for (int i = 0; i < allSelectedImage.length; i++) {
      //   userSelectedImages.add(
      //       FileData(File(allSelectedImage[i].path), getFileSizeResponse[i]));
      // }
      hasSelectedImage = true;
    }
  }

  selectSingleImage(BuildContext context) async {
    final imagePicker = ImagePicker();
    final XFile? selectedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImage == null) {
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
    } else {
      File image = File(selectedImage.path);
      var decodedImage = await decodeImageFromList(image.readAsBytesSync());
      Get.to(() => ResizeImageScreen(
            selectedImage:
                FileData(image, decodedImage.width, decodedImage.height),
          ));
    }
  }
}
