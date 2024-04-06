import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:promina_agency/utils/constants.dart';
import 'package:promina_agency/view/login_screen/login_tablet_screen.dart';
import 'package:promina_agency/view/login_screen/widgets/login_form.dart';
import 'package:promina_agency/view/styles/app_color.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth > 1000
            ? const LoginTabletScreen()
            : SizedBox(
                // width: 100.w,
                // height: 100.h,
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: Stack(
                  children: [
                    Positioned(
                        top: elementHeight(elementHeight: 58.75).h,
                        right: 110,
                        child: Image.asset('assets/images/pink.png')),
                    Positioned(
                        top: elementHeight(elementHeight: 260).h,
                        left: -10.w,
                        child: Image.asset('assets/images/sim.png')),
                    Positioned(
                        left: 15.w,
                        child: Image.asset('assets/images/purple.png')),
                    Positioned(
                        left: 35.w,
                        bottom: 40,
                        child: Image.asset('assets/images/rect.png')),
                    Positioned(
                        left: 10.w,
                        bottom: 320,
                        child: Image.asset('assets/images/rect.png')),
                    Positioned(
                        right: 10.w,
                        bottom: 250,
                        child: Image.asset('assets/images/orange.png')),
                    Positioned(
                        right: 5.w,
                        bottom: 90,
                        child: Image.asset('assets/images/Union.png')),
                    // Blur overlay
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(),
                    ),
                    Positioned(
                        top: elementHeight(elementHeight: -10).h,
                        child: Image.asset('assets/images/camera_waves.png',
                            width: 70.w)),
                    Positioned(
                      bottom: elementHeight(elementHeight: 90).h,
                      right: elementWidth(elementWidth: 20).w,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Text(
                            "My\n Gellary",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.darkGrey,
                                fontWeight: FontWeight.w800,
                                fontSize: 50),
                          )),
                          LoginForm()
                        ],
                      ),
                    )
                  ],
                ),
              );
      },
    ));
  }
}
