// img.Image? photo
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pick_color/pick_color.dart';
import 'package:picsizer/Constants/AppColors.dart';
import 'package:picsizer/Model/FileDataModel.dart';
import 'package:picsizer/Services/NetworkService/CheckConnectivityContainer.dart';

class ExtractColorScreen extends StatefulWidget {
  FileData selectedImage;
  ExtractColorScreen({required this.selectedImage});
  @override
  _ExtractColorScreenState createState() => _ExtractColorScreenState();
}

class _ExtractColorScreenState extends State<ExtractColorScreen> {
  String hexColor = '';
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
          body: ConnectivityConatiner(
            child: Column(
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
                          borderRadius: BorderRadius.circular(25),
                          color: color),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${hexColor}",
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
                        await Clipboard.setData(
                            ClipboardData(text: "${hexColor}"));
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
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
                          child: ColorPicker(
                              child: image,
                              onChanged: (data) {
                                hexColor = data.hexCode;
                                color = data.selectionColor;
                                setState(() {});
                              })),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
