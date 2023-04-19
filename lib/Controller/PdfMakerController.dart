import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:picsizer/Model/FileDataModel.dart';
import 'package:picsizer/Services/FileService.dart';
import 'package:picsizer/View/ImageToPdf/PdfImagePreviewPage.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:get/get.dart';
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
    List<int> data = await document.save();
    FileService.shared.savePdf(data);
  }

  selectMultipleImage(BuildContext context) async {
    final imagePicker = ImagePicker();
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    List<FileData> imageSelected = [];
    if (selectedImages?.length != 0) {
      imageSelected.clear();
      int totalSize = 0;
      await Future.forEach(selectedImages!, (element) async {
        FileData data =
            await FileService.shared.getFileData(File(element.path));
        imageSelected.add(data);
        totalSize += await FileService.shared.getFileBytes(element.path);
      });
      String selectionSize =
          await FileService.shared.getFormattedBytes(totalSize, 2);

      Get.to(PdfImagePreview(userSelectedImage: imageSelected));
    } else {
      SnackBar snackBar = SnackBar(
        content: Text('Please Select a Image!'),
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.purple,
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
