// img.Image? photo
import 'package:flutter/material.dart';
import 'package:picsizer/Constants/AppColors.dart';
import 'package:picsizer/Model/FileDataModel.dart';
import 'package:pixel_color_picker/pixel_color_picker.dart';

class ExtractColorScreen extends StatefulWidget {
  FileData selectedImage;
  ExtractColorScreen({required this.selectedImage});
  @override
  _ExtractColorScreenState createState() => _ExtractColorScreenState();
}

extension hexcode on Color {
  String getHexCode() {
    return '#${this.value.toRadixString(16)}';
  }
}

class _ExtractColorScreenState extends State<ExtractColorScreen> {
  String _hexColor = '';
  late Image image;
  Color? color = Colors.blue;

  var x = 50;
  var y = 25;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image = Image.file(
      widget.selectedImage.imageFile,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: blackBackground,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("Extract Color"),
            centerTitle: true,
          ),
          body: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Drag Your finger On Image  To get Color ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Selected Color",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25), color: color),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "${color?.getHexCode()}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      child: InteractiveViewer(
                        onInteractionUpdate: ((details) {
                          print(details.focalPoint.dx);
                        }),
                        child: PixelColorPicker(
                            child: image,
                            onChanged: (color) {
                              setState(() {
                                this.color = color;

                                // print("${color.value.}")
                              });
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
