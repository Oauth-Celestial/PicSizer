import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picsizer/Controller/CompressImageController.dart';
import 'package:picsizer/Controller/PdfMakerController.dart';
import 'package:picsizer/Controller/ResizeImageContoller.dart';
import 'package:picsizer/Controller/SelectImageController.dart';
import 'package:picsizer/Services/FileService.dart';
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
