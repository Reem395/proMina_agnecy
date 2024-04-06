import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promina_agency/data_providers/remote/apis/api_handler.dart';
import 'package:promina_agency/data_providers/remote/apis/url.dart';
import 'package:promina_agency/models/gallery_model/gallery_model.dart';
import 'package:http/http.dart' as http;
import 'package:promina_agency/utils/image_utils.dart';

import '../../data_providers/local/cache_helper.dart';
import '../../utils/constants.dart';
import 'gallery_states.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(GalleryInitial());
  static GalleryCubit get(context) => BlocProvider.of(context);
  List<String> myGallery = [];

  Future<void> getMyGallery() async {
    try {
      APIHandler.getApi(
          url: getMyGalleryUrl(),
          result: (statusCode, data) {
            if (statusCode == 200) {
              myGallery.clear();
              GalleryModel responseData = GalleryModel.fromJson(data);
              myGallery = [...?responseData.data?.images];
              emit(GetGallerySuccess());
            } else {
              emit(GetGalleryFailed());
            }
          });
    } catch (e) {
      emit(GetGalleryFailed());
      print("Error from getMyGallery :$e");
    }
  }


  Future<void> uploadImage({required ImageSource imageSource}) async {
    try {
      Uint8List? pickedImage = await ImageUtils.pickImage(source: imageSource);
      if (pickedImage != null) {
        http.MultipartRequest request =
            http.MultipartRequest('POST', Uri.parse(uploadImageUrl()));
        request.files.add(http.MultipartFile.fromBytes('img', pickedImage,
            filename: 'image.JPG'));
        String userToken = CacheHelper.getDataFromSharedPreference(
            key: AppSharedPref.userToken.name);
        request.headers['Authorization'] = 'Bearer $userToken';

        http.Response response =
            await http.Response.fromStream(await request.send());
        if (response.statusCode == 200) {
          emit(UploadImageSuccess());
          await getMyGallery();
        } else {
          emit(UploadImageFailed());
        }
      }
    } catch (e) {
      print("Error from upload image: $e");
      emit(UploadImageFailed());
    }
  }
}
