import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:picsizer/Helpers/AppColors.dart';
import 'package:picsizer/Model/HomeTileModel.dart';

class HomeTile extends StatelessWidget {
  HomeTileModel tileData;
  HomeTile({required this.tileData});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
