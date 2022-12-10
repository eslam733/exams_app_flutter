import 'dart:ui';

import 'package:flutter/material.dart';

Color lightGreyColor = "#707070".toColor();
Color accentColor = "#46BCC3".toColor();
Color pinkColor = "#ea0f48".toColor();
Color pinkDarkColor = "#750724".toColor();
Color lightAccentColor = "#EBF7F8".toColor();
Color greyColor = "#7C8788".toColor();
Color borderColor = "#BCCCCD".toColor();
Color dividerColor = "#F1F5F5".toColor();
Color errorColor = "#DD3333".toColor();
Color lightGrey = "#FAFAFA".toColor();
Color darkGrey = "#E8E8E8".toColor();
Color lightColor = "#F5F9F9".toColor();
Color lightAccent = '#F4FAFA'.toColor();
Color shadowColor = "#2690B7B9".toColor();
Color darkShadow = "#99000000".toColor();
Color lightShadow = "#00000000".toColor();
Color white = Colors.white;

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
