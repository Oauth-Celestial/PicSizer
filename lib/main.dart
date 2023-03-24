import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:picsizer/View/Home/HomePage.dart';

void main() {
  runApp(RootPage());
}

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}


// https://mobileappcircular.com/how-to-extract-a-color-palette-from-an-image-in-flutter-dart-d3d49699a5eb

// https://www.color-meanings.com/shades-of-black-color-names-html-hex-rgb-codes/