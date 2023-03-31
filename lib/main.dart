import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:picsizer/Controller/CompressImageController.dart';
import 'package:picsizer/Controller/ResizeImageContoller.dart';
import 'package:picsizer/Controller/SelectImageController.dart';
import 'package:picsizer/Services/FileService.dart';
import 'package:picsizer/View/CompressImage/SingleImageCompress.dart';
import 'package:picsizer/View/ExtractColor/ExtractColor.dart';

import 'package:picsizer/View/Home/HomePage.dart';
import 'package:picsizer/View/ResizeImage/ResizeImageScreen.dart';

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
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}


// https://mobileappcircular.com/how-to-extract-a-color-palette-from-an-image-in-flutter-dart-d3d49699a5eb

// https://www.color-meanings.com/shades-of-black-color-names-html-hex-rgb-codes/

// https://gist.github.com/roipeker/9315aa25301f5c0362caaebd15876c2f get color of pixel

// image_editor_plus: ^0.2.0