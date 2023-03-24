import 'dart:io';
import 'dart:math';

import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:picsizer/Constants/AppConstants.dart';

class FileService {
  static FileService shared = FileService();

  getFileSize(String filepath, int decimals) async {
    var file = File(filepath);
    int bytes = await file.length();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  createFolder() async {
    final path = Directory(basepath);
    var status = await Permission.manageExternalStorage.status;
    if (!status.isGranted) {
      await Permission.manageExternalStorage.request();
    }
    if ((await path.exists())) {
      // TODO:
      print("exist");
    } else {
      // TODO:
      print("not exist");
      path.create();
    }
  }

  compressImage(String imagePath) async {
    final Directory temp = await getTemporaryDirectory();
    String fileName = DateTime.now().toString() + ".jpg";
    String targetPath = '${temp.path}/$fileName';
    // File? compressedImage = await FlutterImageCompress.compressAndGetFile(
    //     imagePath, targetPath,
    //     quality: 45);
    // String fileSize =
    //     await FileHelper.shared.getFileSize(compressedImage!.path, 1);
    // String percentage =
    //     await FileHelper.shared.getSizeDifference(imagePath, targetPath);
    // return FileData(compressedImage, fileSize, percentage);
  }

  saveFile(File compressedImageFile) async {
    String filename = DateTime.now().microsecondsSinceEpoch.toString() + ".jpg";
    String targetPath = basepath + "/$filename";
    await compressedImageFile.copy(targetPath);
  }

  Future<File> resizeImage(
      File targetImage, int resizeWidth, int resizeHeight) async {
    String filename = DateTime.now().toString() + ".jpg";
    File compressedFile = await FlutterNativeImage.compressImage(
        targetImage.path,
        quality: 100,
        targetWidth: 600,
        targetHeight: 300);

    await saveFile(compressedFile);
    return compressedFile;
  }

  getSizeDifference(String originalFilePath, String compressedFilePath) async {
    var originalFile = File(originalFilePath);
    int originalBytes = await originalFile.length();
    var compressFile = File(compressedFilePath);
    int compressBytes = await compressFile.length();
    double percentage = ((originalBytes - compressBytes) / originalBytes) * 100;
    return percentage.toInt().toString();
  }

  getAssetPath({required String fileNameWithExtension}) {
    return "assets/$fileNameWithExtension";
  }
}
