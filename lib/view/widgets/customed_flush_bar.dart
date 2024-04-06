import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/app_color.dart';

Flushbar customizedFlushBar({
  required String titleText,
  required String contentText,
  Color backgroundColor = AppColors.red,
  int duration = 3,
  double titleFontSize = 12,
  double infoIconSize = 32,
  double? contentFontSize,
  Widget? iconWidget,
  FontWeight? titleFontWeight,
  FontWeight? contentFontWeight,
}) {
  return Flushbar(
    backgroundColor: backgroundColor,
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.GROUNDED,
    duration: Duration(seconds: duration),
    titleText: Text(
      titleText,
      style: TextStyle(
          color: AppColors.white,
          fontWeight: titleFontWeight ?? FontWeight.bold,
          fontSize: titleFontSize.sp),
    ),
    messageText: Text(
      contentText,
      style: TextStyle(
          color: AppColors.white,
          fontWeight: contentFontWeight ?? FontWeight.bold,
          fontSize: contentFontSize),
    ),
    icon: contentText.toLowerCase() == 'success'
        ? Icon(
            Icons.info_outline,
            size: infoIconSize,
            color: AppColors.white,
          )
        : Icon(
            Icons.info_outline,
            size: infoIconSize,
            color: AppColors.white,
          ),
  );
}
