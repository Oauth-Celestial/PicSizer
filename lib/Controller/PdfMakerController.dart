import 'dart:io';
import 'package:picsizer/Services/FileService.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class PdfMakerController extends GetxController {
  createPdf(List<File> imageFiles) async {
    final document = PdfDocument();
    for (final file in imageFiles) {
      final image = PdfBitmap(await file.readAsBytes());
      final page = document.pages.add();
      final size = page.getClientSize();
      page.graphics
          .drawImage(image, Rect.fromLTWH(0, 0, size.width, size.height));
    }
    FileService.shared.savePdf(document);
  }
}
