import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picsizer/Constants/AppColors.dart';
import 'package:picsizer/Controller/SelectImageController.dart';
import 'package:picsizer/Model/HomeTileModel.dart';

class HomeTile extends StatelessWidget {
  HomeTileModel tileData;

  HomeTile({required this.tileData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (tileData.title.toLowerCase() == "resize image") {
          SelectImageContoller controller = Get.find<SelectImageContoller>();
          controller.selectSingleImage(context);
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
