import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:picsizer/Constants/AppColors.dart';
import 'package:picsizer/Controller/PdfMakerController.dart';
import 'package:picsizer/Model/FileDataModel.dart';

class PdfImagePreview extends StatelessWidget {
  List<FileData> userSelectedImage;
  PdfImagePreview({required this.userSelectedImage});

  @override
  Widget build(BuildContext context) {
    PdfMakerController pdfController = Get.find<PdfMakerController>();
    return Scaffold(
      backgroundColor: blackBackground,
      appBar: AppBar(
        title: Text("IImage To Pdf"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  child: GridView.builder(
                      itemCount: userSelectedImage.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          crossAxisCount: 3,
                          childAspectRatio: 1 / 1),
                      itemBuilder: (context, index) {
                        File image = userSelectedImage[index].imageFile;
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.file(image),
                                  Container(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 5),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 20,
                                        height: 20,
                                        child: Text("${index + 1}"),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ).animate().fadeIn(
                                  delay: Duration(
                                    milliseconds: 100 * (index + 1),
                                  ),
                                ));
                      }),
                )),
            SizedBox(
              height: 40,
            ),
            Expanded(
                child: Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: InkWell(
                  onTap: (() {
                    List<File> convertFile =
                        userSelectedImage.map((e) => e.imageFile).toList();
                    pdfController.createPdf(convertFile);
                  }),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Convert",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            )),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
