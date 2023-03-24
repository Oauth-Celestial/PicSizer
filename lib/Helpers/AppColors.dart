// https://colorhunt.co/palettes/dark

import 'package:flutter/material.dart';

extension hexcode on String {
  Color getColorForHex() {
    String hexColor = this.toUpperCase().replaceAll('#', '');

    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }

    return Color(int.parse(hexColor, radix: 16));
  }
}

// 282A3A
Color blackBackground = "#0C090A".getColorForHex();
