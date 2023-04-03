import 'package:picsizer/Model/FileDataModel.dart';

class MultiCompressModel {
  List<FileData> userSelectedImages;
  String totalSize;

  MultiCompressModel(
      {required this.totalSize, required this.userSelectedImages});
}
