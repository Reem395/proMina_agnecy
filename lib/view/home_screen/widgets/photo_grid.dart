import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_agency/cubits/gallery_cubit/gallery_cubit.dart';
import 'package:promina_agency/cubits/gallery_cubit/gallery_states.dart';
import 'package:promina_agency/utils/constants.dart';
import 'package:promina_agency/view/styles/app_color.dart';
import 'package:sizer/sizer.dart';

class PhotoGrid extends StatefulWidget {
  const PhotoGrid({super.key});

  @override
  State<PhotoGrid> createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {
  List<String> galleryImages = [];
  @override
  void initState() {
    super.initState();
    GalleryCubit.get(context).getMyGallery();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GalleryCubit, GalleryState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        galleryImages = GalleryCubit.get(context).myGallery;
        if (state is GetGalleryFailed) {
          return const Center(
            child: Text("Please try again Later"),
          );
        }
        return state is GalleryInitial
            ? const Center(child: CircularProgressIndicator(color: AppColors.white))
            : 
            galleryImages.isEmpty?
            const Center(child: Text("Start Uploading your images",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: AppColors.darkGrey),),)
            :Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: elementWidth(elementWidth: 28).w),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: elementWidth(elementWidth: 24).w,
                  mainAxisSpacing: elementHeight(elementHeight: 25).h,
                  shrinkWrap: true,
                  children: List.generate(
                      galleryImages.length,
                      (index) => ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                              galleryImages[index],fit: BoxFit.cover,))),
                ),
              );
      },
    );
  }
}
