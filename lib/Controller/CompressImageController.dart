import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picsizer/Model/FileDataModel.dart';
import 'package:picsizer/Model/MultiCompressModel.dart';
import 'package:picsizer/Services/FileService.dart';
import 'package:picsizer/View/CompressImage/HappyAnimation.dart';
import 'package:picsizer/View/CompressImage/MultipleImageCompress.dart';

class CompressImageController extends GetxController {
  var imagecompressed = Rxn<FileData>();
  var multiImageCompress = RxList<FileData>();
  RxDouble singleImageCompressionScale = 0.0.obs;
  RxDouble multipleImageCompressionScale = 0.0.obs;
  RxInt imageProcessed = 0.obs;
  MultiCompressModel? data;
  MultiCompressModel? compressResult;

  compressSingleImage(File selectedImage, int quality) async {
    imagecompressed.value =
        await FileService.shared.compressImage(selectedImage.path, quality);
  }

  compressMultipleImage(MultiCompressModel model, int quality) async {
    multiImageCompress.value = [];
    imageProcessed.value = 0;
    int totalSize = 0;
    int compressionScale = 0;

    if (quality > 80) {
      compressionScale = 15;
    }

    if (quality > 50) {
      compressionScale = 30;
    }

    if (quality <= 30) {
      compressionScale = 55;
    }

    if (quality <= 50) {
      compressionScale = 45;
    }

    await Future.forEach(model.userSelectedImages, (element) async {
      FileData data = await FileService.shared
          .compressImage(element.imageFile.path, compressionScale);
      imageProcessed.value += 1;
      totalSize += await FileService.shared.getFileBytes(data.imageFile.path);

      multiImageCompress.add(data);
      //totalSize += await FileService.shared.getFileBytes(element.path);
    });
    String selectionSize =
        await FileService.shared.getFormattedBytes(totalSize, 2);
    compressResult = MultiCompressModel(
        totalSize: selectionSize, userSelectedImages: multiImageCompress);
    Get.to(HappyAnimation());
  }

  saveMultipleFile(BuildContext context) async {
    await Future.forEach(multiImageCompress, (element) async {
      await FileService.shared.saveFile(element.imageFile);
    });

    SnackBar snackBar = SnackBar(
      content: Text('All Files Saved'),
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

  selectMultipleImage(BuildContext context) async {
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
