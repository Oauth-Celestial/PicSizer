import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:picsizer/Constants/AppColors.dart';
import 'package:picsizer/Model/HomeTileModel.dart';

class HomePageController extends GetxController {
  List<HomeTileModel> homeOptions = [
    HomeTileModel(
        title: "Resize Image",
        tileIcon: Icon(
          Icons.crop,
          color: blackBackground,
        )),
    HomeTileModel(
        title: "Compress Image",
        tileIcon: Icon(Icons.compress, color: blackBackground)),
    HomeTileModel(
        title: "Extract Color",
        tileIcon: Icon(Icons.palette, color: blackBackground)),
    HomeTileModel(
        title: "Image To Pdf",
        tileIcon: Icon(Icons.picture_as_pdf, color: blackBackground))
  ];
}
