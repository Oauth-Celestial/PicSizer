import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picsizer/Constants/AppColors.dart';
import 'package:picsizer/Controller/CompressImageController.dart';
import 'package:picsizer/View/CompressImage/CompressPage.dart';
import 'package:picsizer/View/CompressImage/ResultPageCard.dart';

class ImageCompressResult extends StatelessWidget {
  const ImageCompressResult({super.key});

  @override
  Widget build(BuildContext context) {
    CompressImageController imageController = Get.find();

    return Scaffold(
      backgroundColor: blackBackground,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: (() {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    }),
                    child: Container(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "From",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${imageController.data?.totalSize}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "To",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${imageController.compressResult?.totalSize}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ResultCard()
          ],
        ),
      ),
    );
  }
}
