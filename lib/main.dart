import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picsizer/Controller/CompressImageController.dart';
import 'package:picsizer/Controller/PdfMakerController.dart';
import 'package:picsizer/Controller/ResizeImageContoller.dart';
import 'package:picsizer/Controller/SelectImageController.dart';
import 'package:picsizer/Services/FileService.dart';
import 'package:picsizer/Services/NetworkService/ConnectionHelper.dart';
import 'package:picsizer/View/CompressImage/HappyAnimation.dart';
import 'package:picsizer/View/SplashScreen/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FileService.shared.createFolder();
  runApp(RootPage());
}

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SelectImageContoller());
    Get.put(ResizeImageContoller());
    Get.put(CompressImageController());
    Get.put(PdfMakerController());
    return GetMaterialApp(home: SplashScreen());
  }
}


// https://mobileappcircular.com/how-to-extract-a-color-palette-from-an-image-in-flutter-dart-d3d49699a5eb

// https://www.color-meanings.com/shades-of-black-color-names-html-hex-rgb-codes/

// https://gist.github.com/roipeker/9315aa25301f5c0362caaebd15876c2f get color of pixel

// image_editor_plus: ^0.2.0

// https://www.youtube.com/watch?v=PPmklgYoVjw