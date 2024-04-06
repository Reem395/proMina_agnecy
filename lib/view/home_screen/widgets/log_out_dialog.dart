import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:promina_agency/data_providers/local/cache_helper.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constants.dart';
import '../../styles/app_color.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: 80.w,
            height: 22.h,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: AppColors.white)),
            child: Center(
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          top: elementHeight(elementHeight: 10).h,
                          bottom: elementHeight(elementHeight: 10).h),
                      child: const Icon(
                        Icons.info_outline,
                        size: 50,
                        color: AppColors.marron,
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          // top: elementHeight(elementHeight: 10).h,
                          bottom: elementHeight(elementHeight: 10).h),
                      child: Text(
                        "Are you sure you want to log out?",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black.withOpacity(0.7)),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          CacheHelper.clearData();
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/', (route) => false);
                        },
                        child: const Text(
                          "Log out",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.darkGrey),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.darkGrey),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
