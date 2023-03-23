import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:picsizer/View/HomePage.dart';

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
