import 'dart:io';

import 'package:image/image.dart';

class FileData {
  final File imageFile;
  final int imageWidth;
  final int imageHeight;
  String? filesize;

  FileData(this.imageFile, this.imageWidth, this.imageHeight,
      [this.filesize = "10"]);
}
