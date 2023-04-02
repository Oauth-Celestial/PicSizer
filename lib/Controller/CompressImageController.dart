import 'dart:io';

import 'package:get/get.dart';
import 'package:picsizer/Model/FileDataModel.dart';
import 'package:picsizer/Services/FileService.dart';

class CompressImageController extends GetxController {
  var imagecompressed = Rxn<FileData>();
  var multiImageCompress = RxList<FileData>();
  RxDouble singleImageCompressionScale = 0.0.obs;
  RxDouble multipleImageCompressionScale = 0.0.obs;

  compressSingleImage(File selectedImage, int quality) async {
    imagecompressed.value =
        await FileService.shared.compressImage(selectedImage.path, quality);
  }
}
