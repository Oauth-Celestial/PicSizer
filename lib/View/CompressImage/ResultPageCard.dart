import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:picsizer/Controller/CompressImageController.dart';
import 'package:picsizer/Model/FileDataModel.dart';

class ResultCard extends StatelessWidget {
  ResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    CompressImageController imageController = Get.find();
    return Container(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imageController.multiImageCompress.length,
          itemBuilder: ((context, index) {
            FileData item = imageController.multiImageCompress[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 100,
                child: Image.file(
                  item.imageFile,
                  fit: BoxFit.contain,
                ),
              ),
            );
          })),
    );
  }
}
