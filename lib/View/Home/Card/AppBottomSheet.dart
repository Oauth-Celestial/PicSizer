import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picsizer/Controller/CompressImageController.dart';
import 'package:picsizer/Controller/SelectImageController.dart';
import 'package:picsizer/Services/FontHelper.dart';

buildSheet(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (builder) {
        return new Container(
          height: 150,
          color: Colors.transparent, //could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child: new Container(
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0))),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Compress Image",
                      style: FontHelper.mediumNotaSansItalic(
                          TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                  SelectImageContoller controller =
                                      Get.find<SelectImageContoller>();
                                  controller.selectSingleImage(
                                      context, "single compress");
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(25)),
                                  height: 40,
                                  child: Text(
                                    "Single",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                  CompressImageController controller =
                                      Get.find();
                                  controller.selectMultipleImage(context);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(25)),
                                  height: 40,
                                  child: Text(
                                    "Multiple",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
        );
      });
}
