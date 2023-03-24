import 'dart:io';

import 'package:image/image.dart';

class FileData {
  final File imageFile;
  final int imageWidth;
  final int imageHeight;

  FileData(
    this.imageFile,
    this.imageWidth,
    this.imageHeight,
  );
}
