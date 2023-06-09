import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picsizer/Model/FileDataModel.dart';
import 'package:picsizer/Services/FileService.dart';
import 'package:picsizer/View/CompressImage/SingleImageCompress.dart';
import 'package:picsizer/View/ExtractColor/ExtractColor.dart';
import 'package:picsizer/View/ResizeImage/ResizeImageScreen.dart';

class SelectImageContoller extends GetxController {
  List<XFile> allSelectedImage = [];
  List<FileData> userSelectedImages = [];
  FileData? selectedImage;
  bool hasSelectedImage = false;

  // selectMultipleImage() async {

  //   if (selectedImages!.isNotEmpty) {
  //     allSelectedImage.addAll(selectedImages);
  //     userSelectedImages = [];
  //     List<Future> getFileSize = [];
  //     // for (int i = 0; i < allSelectedImage.length; i++) {
  //     //   getFileSize
  //     //       .add(FileService.shared.getFileSize(allSelectedImage[i].path, 1));
  //     // }

  //     // for (int i = 0; i < allSelectedImage.length; i++) {
  //     //   userSelectedImages.add(
  //     //       FileData(File(allSelectedImage[i].path), getFileSizeResponse[i]));
  //     // }
  //     hasSelectedImage = true;
  //   }
  // }

  selectSingleImage(BuildContext context, String navigateTo) async {
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
      switch (navigateTo.toLowerCase()) {
        case "resize image":
          File image = File(selectedImage.path);
          var decodedImage = await decodeImageFromList(image.readAsBytesSync());
          Get.to(() => ResizeImageScreen(
                selectedImage:
                    FileData(image, decodedImage.width, decodedImage.height),
              ));
          break;
        case "extract color":
          File image = File(selectedImage.path);
          var decodedImage = await decodeImageFromList(image.readAsBytesSync());
          Get.to(() => ExtractColorScreen(
                selectedImage:
                    FileData(image, decodedImage.width, decodedImage.height),
              ));
          break;

        case "single compress":
          File image = File(selectedImage.path);
          var decodedImage = await decodeImageFromList(image.readAsBytesSync());
          var filesize =
              await FileService.shared.getFileSize(selectedImage.path, 2);
          Get.to(() => SingleImageCompressePreview(
                selectedImage: FileData(
                    image, decodedImage.width, decodedImage.height, filesize),
              ));
          break;

        default:
          break;
      }
    }
  }
}
