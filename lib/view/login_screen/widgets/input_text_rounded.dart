import 'package:flutter/material.dart';
import 'package:promina_agency/utils/constants.dart';
import 'package:sizer/sizer.dart';

import '../../styles/app_color.dart';

class InputTextRounded extends StatelessWidget {
  const InputTextRounded(
      {super.key,
      this.controller,
      this.backGroundColor,
      this.borderRaduis,
      this.hintTextStyle,
      this.hintText,
      this.validator,
      this.border,
      this.enabledBorder,
      this.focusedBorder,
      this.errorBorder,
      this.keyboardType,
      this.contentPadding,
      this.obscureText = false});
  final TextEditingController? controller;
  final Color? backGroundColor;
  final double? borderRaduis;
  final TextStyle? hintTextStyle;
  final String? hintText;
  final String? Function(String? value)? validator;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final TextInputType? keyboardType;
  final bool obscureText;
  final EdgeInsetsGeometry? contentPadding;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.top,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintTextStyle ??
              const TextStyle(
                  color: AppColors.hintGrey, fontWeight: FontWeight.w400),
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(
                  vertical: 0, horizontal: elementWidth(elementWidth: 21.41).w),
          filled: true,
          fillColor: backGroundColor ?? AppColors.white,
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.white),
                borderRadius: BorderRadius.circular(borderRaduis ?? 22.0),
              ),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.white),
                borderRadius: BorderRadius.circular(22),
              ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.white),
            borderRadius: BorderRadius.circular(22),
          ),
          errorBorder: errorBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.white),
                borderRadius: BorderRadius.circular(22),
              ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.white),
            borderRadius: BorderRadius.circular(22),
          ),
          errorStyle: const TextStyle(height: 0, color: AppColors.white),
          border: border),
    );
  }
}
