import 'package:flutter/material.dart';
import 'package:promina_agency/utils/constants.dart';
import 'package:promina_agency/view/styles/app_color.dart';
import 'package:sizer/sizer.dart';

class DialogActionButton extends StatelessWidget {
  const DialogActionButton(
      {super.key,
      required this.onPressed,
      this.backgroundColor = AppColors.lightPurple,
      required this.image,
      required this.title});
  final void Function() onPressed;
  final Color? backgroundColor;
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: elementWidth(elementWidth: 184).w,
        height: elementHeight(elementHeight: 65).h,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            SizedBox(
              width: 1.w,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGrey),
            )
          ],
        ),
      ),
    );
  }
}
