import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getTextStyle(double fontSize, Color color, FontWeight fontWeight) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle getRegularStyle({
  required Color color,
  double fontSize = 14,
}) {
  return getTextStyle(
    fontSize,
    color,
    FontWeightManager.regular,
  );
}

TextStyle getLightStyle({
  required Color color, double fontSize = 12,
}) {
  return getTextStyle(
    fontSize,
    color,
    FontWeightManager.light,
  );
}

TextStyle getMediumStyle({
  required Color color,
  double fontSize = 16,
}) {
  return getTextStyle(
    fontSize,
    color,
    FontWeightManager.medium,
  );
}

TextStyle getSemiBoldStyle({
  required Color color,
  double fontSize = 12,
}) {
  return getTextStyle(
    fontSize,
    color,
    FontWeightManager.semiBold,
  );
}

TextStyle getBoldStyle({
  required Color color,
  double fontSize = 16,
}) {
  return getTextStyle(
    fontSize,
    color,
    FontWeightManager.bold,
  );
}

TextStyle getExtraBoldStyle({
  required Color color,
  double fontSize = 30,
}) {
  return getTextStyle(fontSize, color, FontWeightManager.bold);
}

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}
