import 'package:flutter/material.dart';
import 'package:todo/core/theme/colors.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  ThemeData theme = ThemeData(
    primaryColor: AppColor.primaryColor,
    highlightColor: AppColor.highLightColor,
    appBarTheme: AppBarTheme(
      color: AppColor.primaryColor,
      titleTextStyle: TextStyle(
        color: AppColor.textPrimary,
        fontSize: 14.0.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          color: AppColor.textPrimary,
          fontSize: 14.0.sp,
          fontWeight: FontWeight.bold),
      headline2: TextStyle(
        color: AppColor.textPrimary,
        fontSize: 10.0.sp,
      ),
      bodyText1: TextStyle(
        color: AppColor.textPrimary,
        fontSize: 12.0.sp,
      ),
      bodyText2: TextStyle(
        color: AppColor.textAccent,
        fontSize: 12.0.sp,
      ),
    ),
  );
}
