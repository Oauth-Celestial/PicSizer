import 'dart:io';

import 'package:get/get.dart';
import 'package:picsizer/Model/FileDataModel.dart';
import 'package:picsizer/Services/FileService.dart';

class CompressImageController extends GetxController {
  var imagecompressed = Rxn<FileData>();
  compressSingleImage(File selectedImage, int quality) async {
    imagecompressed.value =
        await FileService.shared.compressImage(selectedImage.path, quality);
  }
}
