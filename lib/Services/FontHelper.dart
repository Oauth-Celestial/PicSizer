import 'package:flutter/cupertino.dart';

class FontHelper {
  static FontHelper shared = FontHelper();

  static TextStyle regularPaytone(TextStyle style) {
    return style.copyWith(fontFamily: "PayTone", fontWeight: FontWeight.w700);
  }

  static TextStyle mediumNotaSansItalic(TextStyle style) {
    return style.copyWith(
      fontFamily: "NotoSans",
      fontWeight: FontWeight.w500,
    );
  }
}
