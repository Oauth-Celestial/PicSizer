import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:picsizer/Constants/AppColors.dart';

class CompressImage extends StatelessWidget {
  const CompressImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Compress Image"),
        centerTitle: true,
      ),
      backgroundColor: blackBackground,
      body: SafeArea(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                width: 200,
                height: 50,
                child: Text(
                  "Single Image",
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                width: 200,
                height: 50,
                child: Text(
                  "Multiple Image",
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)),
              ),
            )
          ],
        ),
      )),
    );
  }
}
