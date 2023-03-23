import 'package:flutter/material.dart';
import 'package:picsizer/Helpers/AppColors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBackground,
      body: SafeArea(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "What Can\nI help you with ?",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Container()
          ],
        ),
      )),
    );
  }
}
