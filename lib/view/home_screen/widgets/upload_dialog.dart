import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promina_agency/cubits/gallery_cubit/gallery_cubit.dart';
import 'package:promina_agency/cubits/gallery_cubit/gallery_states.dart';
import 'package:promina_agency/utils/constants.dart';
import 'package:promina_agency/view/styles/app_color.dart';
import 'package:sizer/sizer.dart';

import 'dialog_action_btn.dart';

class UploadDialog extends StatefulWidget {
  const UploadDialog({super.key});

  @override
  State<UploadDialog> createState() => _UploadDialogState();
}

class _UploadDialogState extends State<UploadDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: 80.w,
            height: 32.h,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: AppColors.white)),
            child: Center(
              child: BlocConsumer<GalleryCubit, GalleryState>(
                listener: (context, state) {
                  if (state is UploadImageSuccess) {
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: elementHeight(elementHeight: 45).h,
                            bottom: elementHeight(elementHeight: 30).h),
                        child: DialogActionButton(
                          onPressed: () async {
                            await GalleryCubit.get(context)
                                .uploadImage(imageSource: ImageSource.gallery);
                          },
                          image: 'assets/images/gallery.png',
                          title: 'Gellary',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: elementHeight(elementHeight: 30).h),
                        child: DialogActionButton(
                          onPressed: () async {
                            await GalleryCubit.get(context)
                                .uploadImage(imageSource: ImageSource.camera);
                          },
                          backgroundColor: AppColors.lightBlue,
                          image: 'assets/images/camera.png',
                          title: 'Camera',
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
