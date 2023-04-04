import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:picsizer/Controller/CompressImageController.dart';

class ImageCompressResult extends StatelessWidget {
  const ImageCompressResult({super.key});

  @override
  Widget build(BuildContext context) {
    CompressImageController imageController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        centerTitle: true,
      ),
      body: Container(
        child: Text("${imageController.compressResult?.totalSize}"),
      ),
    );
  }
}
