import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_agency/cubits/auth_cubit/auth_state.dart';
import 'package:promina_agency/data_providers/remote/apis/api_handler.dart';
import 'package:promina_agency/models/login_model/login_model.dart';
import 'package:promina_agency/utils/constants.dart';
import 'package:promina_agency/view/widgets/customed_flush_bar.dart';

import '../../data_providers/local/cache_helper.dart';
import '../../data_providers/remote/apis/url.dart';

class AuthCubit extends Cubit<UserState> {
  AuthCubit() : super(UserInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  String? userToken;
  String userName = '';
  Future userLogin(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      emit(LoginInitial());
      APIHandler.postApi(
          url: loginUrl(),
          body: {'email': email, 'password': password},
          result: (statusCode, data) {
            if (statusCode == 200) {
              LoginModel responseData = LoginModel.fromJson(data);
              if (responseData.errorMessage != null) {
                customizedFlushBar(
                        titleText: 'Error', contentText: 'Invalid Credntials')
                    .show(context);
                emit(LoginFailed());
              } else {
                userToken = responseData.token;
                userName = responseData.user?.name ?? "";
                CacheHelper.saveDataSharedPreference(
                    key: AppSharedPref.userToken.name,
                    value: responseData.token);
                emit(LoginSuccess());
                Navigator.pushNamedAndRemoveUntil(
                    context, '/Home', (route) => false);
              }
            } else {
              customizedFlushBar(
                        titleText: 'Error', contentText: 'Please try again later')
                    .show(context);
              emit(LoginFailed());
            }
          });
    } catch (e) {
      print("error from userLogin:$e");
      customizedFlushBar(
                        titleText: 'Error', contentText: 'Please try again later')
                    .show(context);
      emit(LoginFailed());
    }
  }
}
