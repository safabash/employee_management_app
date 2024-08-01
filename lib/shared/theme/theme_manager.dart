import 'package:employee_management_app/shared/theme/color_manager.dart';
import 'package:employee_management_app/shared/theme/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getApplicationThemeLight(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: ColorManagerLight.scaffoldBgColor,
    primaryColor: ColorManagerLight.primaryColor,
    useMaterial3: false,
    appBarTheme: AppBarTheme(backgroundColor: ColorManagerLight.primaryColor),
    textTheme: TextTheme(
      titleMedium:
          getMediumStyle(color: ColorManagerLight.textColor, fontSize: 27),
      displayMedium: getRegularStyle(
          color: ColorManagerLight.secondaryTextColor, fontSize: 14),
      labelLarge:
          getRegularStyle(color: ColorManagerLight.textColor, fontSize: 16),
      labelMedium:
          getRegularStyle(color: ColorManagerLight.primaryColor, fontSize: 14),
      labelSmall: getRegularStyle(
          color: ColorManagerLight.secondaryTextColor, fontSize: 12),

      //   // //black shade - input text color
      bodyMedium: getRegularStyle(
          color: ColorManagerLight.scaffoldBgColor, fontSize: 12),
    ),
  );
}
