import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:picsizer/Constants/AppColors.dart';

class ParallexList extends StatefulWidget {
  const ParallexList({super.key});

  @override
  State<ParallexList> createState() => _ParallexListState();
}

class _ParallexListState extends State<ParallexList> {
  PageController controller = PageController(viewportFraction: 0.7);
  double pageOffset = 0.0;
  List<String> images = [
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.jpg"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      pageOffset = controller.page!;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView.builder(
            itemCount: images.length,
            controller: controller,
            clipBehavior: Clip.antiAlias,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  child: Image.asset(
                    "assets/${images[index]}",
                    fit: BoxFit.cover,
                    alignment: Alignment(
                        -pageOffset.abs(), -pageOffset.abs() + index * 0.2),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
