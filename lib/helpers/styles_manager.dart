import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color,
    [bool underline = false]) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    bool underline = false}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily,
      FontWeightManager.regular, color, underline);
}
// light text style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.light, color);
}
// bold text style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, required Color color, underline = false}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily,
      FontWeightManager.bold, color, underline);
}

// bold text style

TextStyle getUltraBoldStyle(
    {double fontSize = FontSize.s12, required Color color, underline = false}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily,
      FontWeightManager.ultraBold, color, underline);
}

// semi bold text style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.semiBold, color);
}

// medium text style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.medium, color);
}
