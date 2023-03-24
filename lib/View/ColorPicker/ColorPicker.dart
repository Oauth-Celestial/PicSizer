// img.Image? photo;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  String _hexColor = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTapDown: (details) {
                _getCurrentPixelHexColor(details.localPosition);
              },
              child: Container(
                width: 300,
                height: 300,
                child: Image.asset("assets/test.jpg"),
              ),
            ),
            SizedBox(height: 16),
            Text(_hexColor),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Future<void> _getCurrentPixelHexColor(Offset localPosition) async {
    File _image = await getImageFileFromAssets("");
    img.Image decodedImage = await convertImageToImg(_image);
    img.Color pixelColor = decodedImage.getPixelCubic(
        localPosition.dx.toInt(), localPosition.dy.toInt());
    // var myColor = getFlutterColor(pixelColor.);
    var hex = '#${pixelColor.r.toString()}';
    print(hex);
  }

  Color getFlutterColor(int abgr) {
    int argb = abgrToArgb(abgr);
    return Color(argb);
  }

  int abgrToArgb(int argbColor) {
    int r = (argbColor >> 16) & 0xFF;
    int b = argbColor & 0xFF;
    return (argbColor & 0xFF00FF00) | (b << 16) | r;
  }
}

Future<img.Image> convertImageToImg(File file) async {
  // Read the file as bytes
  final bytes = await file.readAsBytes();

  // Decode the bytes into an Image object
  final image = await decodeImageFromList(bytes);

  // Create a Uint8List from the bytes
  final byteData = Uint8List.fromList(bytes);

  // Use the Image package to convert the Uint8List to an img.Image
  return img.decodeImage(byteData)!;
}

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/test.jpg');

  final file = File('${(await getTemporaryDirectory()).path}/test.jpg');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}
