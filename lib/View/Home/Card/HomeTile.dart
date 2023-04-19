import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picsizer/Constants/AppColors.dart';
import 'package:picsizer/Controller/PdfMakerController.dart';
import 'package:picsizer/Controller/SelectImageController.dart';
import 'package:picsizer/Model/HomeTileModel.dart';
import 'package:picsizer/View/CompressImage/CompressPage.dart';
import 'package:picsizer/View/ImageToPdf/PdfImageSelection.dart';

class HomeTile extends StatelessWidget {
  HomeTileModel tileData;

  HomeTile({required this.tileData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        SelectImageContoller controller = Get.find<SelectImageContoller>();
        PdfMakerController pdfController = Get.find<PdfMakerController>();
        switch (tileData.title.toLowerCase()) {
          case "resize image":
            controller.selectSingleImage(context, "resize image");
            break;
          case "extract color":
            controller.selectSingleImage(context, "extract color");
            break;
          case "compress image":
            Get.to(CompressImage());
            break;
          case "image to pdf":
            pdfController.selectMultipleImage(context);
            break;
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 13),
                    child: Text(
                      "${tileData.title}",
                      style: TextStyle(
                          color: blackBackground,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  )
                ],
              ),
              Positioned.fill(
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 5, right: 5),
                        child: Container(
                          child: tileData.tileIcon,
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
