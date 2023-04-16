// img.Image? photo
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picsizer/Constants/AppColors.dart';
import 'package:picsizer/Model/FileDataModel.dart';
import 'package:pixel_color_picker/pixel_color_picker.dart';

class ExtractColorScreen extends StatefulWidget {
  FileData selectedImage;
  ExtractColorScreen({required this.selectedImage});
  @override
  _ExtractColorScreenState createState() => _ExtractColorScreenState();
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
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
                      "${color?.toHex().substring(3)}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(
                          text: "${color?.toHex().substring(3)}"));
                      SnackBar snackBar = SnackBar(
                        content: Text('Copied To ClipBoard'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.copy_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      height: 40,
                      child: Container(
                        alignment: Alignment.center,
                        width: 130,
                        height: 35,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Save Hex Code",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  )
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
