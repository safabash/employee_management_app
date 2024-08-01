import 'package:employee_management_app/shared/theme/color_manager.dart';
import 'package:employee_management_app/shared/theme/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getApplicationThemeLight(BuildContext context) {
  return ThemeData(
    // shadowColor: ColorManagerLight.lightGreyColor,
    // brightness: Brightness.light,
    // visualDensity: VisualDensity.adaptivePlatformDensity,
    // // fontFamily: GoogleFonts.inter().fontFamily,
    // canvasColor: ColorManagerLight.canvasColor,
    scaffoldBackgroundColor: ColorManagerLight.scaffoldBgColor,
    primaryColor: ColorManagerLight.primaryColor,

    useMaterial3: false,
    appBarTheme: const AppBarTheme(

        // iconTheme: IconThemeData(color: ColorManagerLight.secondary, size: 24.sp),
        // actionsIconTheme:
        //     IconThemeData(color: ColorManagerLight.secondary, size: 24.sp),
        // centerTitle: true,
        // titleTextStyle: getRegularStyle(
        //   color: ColorManagerLight.lightTextColor,
        //   fontSize: FontSizeManager.f18,
        // ),
        // shadowColor: Colors.transparent,
        ),

    // //elevated button
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     shape:
    //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
    //     backgroundColor: ColorManagerLight.primary,
    //     foregroundColor: ColorManagerLight.lightTextColor,
    //     padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 14.h),
    //     textStyle: getSemiBoldStyle(color: ColorManagerLight.lightTextColor),
    //   ),
    // ),

    // //input decoration
    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
    //   fillColor: ColorManagerLight.fillColor,
    //   hintStyle: getRegularStyle(
    //     color: ColorManagerLight.subTitleColor,
    //     fontSize: FontSizeManager.f14,
    //   ),
    //   prefixIconColor: ColorManagerLight.textColor,
    //   focusColor: ColorManagerLight.borderColor,
    //   border: formBorder,
    //   // suffixIconColor: ColorMangerLight.secondary,
    //   enabledBorder: formBorder,
    //   focusedBorder: formBorder,
    //   errorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(10.r),
    //     borderSide: BorderSide(color: ColorManagerLight.errorColor),
    //   ),
    // ),

    //text theme
    textTheme: TextTheme(
      //white text

      titleMedium:
          getMediumStyle(color: ColorManagerLight.textColor, fontSize: 27),
      displayMedium: getRegularStyle(
          color: ColorManagerLight.secondaryTextColor, fontSize: 14),
      //   displaySmall: getRegularStyle(color: ColorManagerLight.greyTextColor),
      //   headlineLarge: getExtraBoldStyle(
      //     color: ColorManagerLight.secondary,
      //   ),
      //   // getExtraBoldStyle(color: ColorManagerLight.lightTextColor),
      //   headlineSmall: getRegularStyle(
      //     color: ColorManagerLight.greyTextColor,
      //     fontSize: FontSizeManager.f12,
      //   ),

      //   displayLarge: getMediumStyle(color: ColorManagerLight.backgroundColor),
      //   headlineMedium: getExtraBoldStyle(
      //     color: ColorManagerLight.secondary,
      //     fontSize: FontSizeManager.f12,
      //   ),
      //   titleLarge: getBoldStyle(color: ColorManagerLight.secondary),

      //   titleSmall:
      //       getSemiBoldStyle(color: ColorManagerLight.secondary, fontSize: 16.sp),

      //   labelLarge:
      //       getSemiBoldStyle(color: ColorManagerLight.secondary, fontSize: 24.sp),
      labelMedium:
          getRegularStyle(color: ColorManagerLight.primaryColor, fontSize: 14),
      labelSmall: getRegularStyle(
          color: ColorManagerLight.secondaryTextColor, fontSize: 12),
      //   bodySmall:
      //       getRegularStyle(color: ColorManagerLight.secondary, fontSize: 10.sp),
      //   bodyLarge: getMediumStyle(
      //     color: ColorManagerLight.secondary,
      //     fontSize: FontSizeManager.f14,
      //   ),

      //   // //black shade - input text color
      bodyMedium: getRegularStyle(
          color: ColorManagerLight.scaffoldBgColor, fontSize: 12),
    ),
    // colorScheme: ColorScheme(
    //   primary: ColorManagerLight.primary,
    //   secondary: ColorManagerLight.secondary,

    //   scrim: ColorManagerLight.basicGrey,
    //   onPrimary: ColorManagerLight.hintColor,
    //   onSecondary: ColorManagerLight.secondary,
    //   onError: ColorManagerLight.redColor,
    //   onBackground: ColorManagerLight.backgroundColor,
    //   onSurface: ColorManagerLight.primary,
    //   brightness: Brightness.light,
    //   onInverseSurface: ColorManagerLight.indicatorGrey,

    //   // primaryContainer: ColorManagerLight.primaryDark,
    //   // onSecondaryContainer: ColorManagerLight.iconBackground,

    //   tertiary: ColorManagerLight.greyTextColor,
    //   background: ColorManagerLight.backgroundColor,
    //   error: ColorManagerLight.primary,
    //   outline: ColorManagerLight.lightOutline,
    //   surface: ColorManagerLight.greyButtonColor,
    //   // onSurfaceVariant: ColorManagerLight.tileColor,
    //   // inversePrimary: ColorManagerLight.textColor,
    //   // inverseSurface: ColorManagerLight.diffGrayColor,
    //   onPrimaryContainer: ColorManagerLight.purpleColor,
    // secondaryContainer: ColorManagerLight.secondaryDark,
    //   ),
  );
}
