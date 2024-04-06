import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:promina_agency/cubits/auth_cubit/auth_cubit.dart';
import 'package:promina_agency/utils/constants.dart';
import 'package:promina_agency/view/home_screen/widgets/control_bar.dart';
import 'package:promina_agency/view/home_screen/widgets/photo_grid.dart';
import 'package:promina_agency/view/styles/app_color.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            print("width: ${constraints.maxWidth}");
            return SizedBox(
              // height: 100.h,
              // width: 100.w,
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/home_background.png',
                    width: constraints.maxWidth,
                    fit: BoxFit.fill,
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(),
                  ),
                  Image.asset(
                    'assets/images/mask.png',
                    width: constraints.maxWidth,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: elementWidth(elementWidth: 27).w,
                                top: elementHeight(elementHeight: 15.h)),
                            child: SizedBox(
                              width: 60.w,
                              child: Text(
                                "Welcome\n${AuthCubit.get(context).userName}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: const TextStyle(
                                    fontSize: 30, color: AppColors.darkGrey),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: elementWidth(elementWidth: 31).w,
                                bottom: elementHeight(elementHeight: 20.h)),
                            child: Image.asset('assets/images/avatar.png'),
                          ),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              top: elementHeight(elementHeight: 49.95).h,
                              bottom: elementHeight(elementHeight: 34.74).h),
                          child: const ControlBar()),
                      const Expanded(child: PhotoGrid())
                    ],
                  )
                ],
              ),
            );
          },
          // child:
        ),
      ),
    );
  }
}
