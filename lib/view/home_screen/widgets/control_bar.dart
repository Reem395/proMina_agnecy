import 'package:flutter/material.dart';
import 'package:promina_agency/view/home_screen/widgets/upload_dialog.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constants.dart';
import '../../styles/app_color.dart';
import 'log_out_dialog.dart';

class ControlBar extends StatelessWidget {
  const ControlBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //LogOut Tab
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return SizedBox(height: 30.h, child: const LogOutDialog());
              },
            );
          },
          child: Container(
            height: elementHeight(elementHeight: 42).h,
            width: elementWidth(elementWidth: 145).w,
            decoration: BoxDecoration(
                color: AppColors.white, borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: elementWidth(elementWidth: 15.27).w),
                  child: Container(
                    height: elementHeight(elementHeight: 32.22).h,
                    width: elementWidth(elementWidth: 28.83).w,
                    decoration: BoxDecoration(
                        color: AppColors.red,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.5),
                            blurRadius: 10,
                            offset: const Offset(-4, 1),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8)),
                    child: const ImageIcon(
                      AssetImage('assets/images/back.png'),
                      color: AppColors.white,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: elementWidth(elementWidth: 9.32).w),
                  child: const Text(
                    "log out",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ),
        //upload Tab
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return SizedBox(height: 30.h, child: const UploadDialog());
              },
            );
          },
          child: Container(
            height: elementHeight(elementHeight: 42).h,
            width: elementWidth(elementWidth: 145).w,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: elementWidth(elementWidth: 15.27).w),
                  child: Container(
                    height: elementHeight(elementHeight: 32.22).h,
                    width: elementWidth(elementWidth: 28.83).w,
                    decoration: BoxDecoration(
                        color: AppColors.orange,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.withOpacity(0.5),
                            blurRadius: 10,
                            offset: const Offset(-4, 1),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8)),
                    child: const ImageIcon(
                      AssetImage('assets/images/up.png'),
                      color: AppColors.white,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: elementWidth(elementWidth: 9.32).w),
                  child: const Text(
                    "upload",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
