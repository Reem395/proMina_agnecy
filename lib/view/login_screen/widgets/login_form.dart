import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_agency/cubits/auth_cubit/auth_cubit.dart';
import 'package:promina_agency/utils/constants.dart';
import 'package:promina_agency/view/login_screen/widgets/input_text_rounded.dart';
import 'package:promina_agency/view/styles/app_color.dart';
import 'package:promina_agency/view/widgets/customed_flush_bar.dart';
import 'package:sizer/sizer.dart';

import '../../../cubits/auth_cubit/auth_state.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String errorMsg = '';
  final _formKey = GlobalKey<FormState>();
  RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(top: elementHeight(elementHeight: 52).h),
        child: Container(
          height: elementHeight(elementHeight: 420).h,
          width: elementWidth(elementWidth: 388).w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: AppColors.white.withOpacity(0.4)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: elementHeight(elementHeight: 30).h),
                child: const Text(
                  "LOG IN",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkGrey),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                    top: elementHeight(elementHeight: 32).h,
                    bottom: elementHeight(elementHeight: 37.89).h,
                    left: elementWidth(elementWidth: 31).w,
                    right: elementWidth(elementWidth: 31).w,
                  ),
                  child: InputTextRounded(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        errorMsg = 'UserName is required';
                        return '';
                      }
                      if (!emailRegex.hasMatch(value)) {
                        errorMsg = 'Please enter valid email';
                        return '';
                      }
                      return null;
                    },
                    hintText: "User Name",
                  )),
              Padding(
                  padding: EdgeInsets.only(
                    left: elementWidth(elementWidth: 31).w,
                    right: elementWidth(elementWidth: 31).w,
                  ),
                  child: InputTextRounded(
                    controller: _passwordController,
                    obscureText: true,
                    hintText: "Password",
                    validator: (value) {
                      if (value!.isEmpty) {
                        errorMsg = 'Enter your password';
                        return '';
                      }
                      return null;
                    },
                  )),
              Padding(
                padding: EdgeInsets.only(
                  top: elementHeight(elementHeight: 37.89).h,
                  bottom: elementHeight(elementHeight: 47.89).h,
                  left: elementWidth(elementWidth: 31).w,
                  right: elementWidth(elementWidth: 31).w,
                ),
                child: BlocBuilder<AuthCubit, UserState>(
                  builder: (context, state) {
                    return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            AuthCubit.get(context).userLogin(
                              context: context,
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                          } else {
                            customizedFlushBar(
                                    titleText: 'Alert', contentText: errorMsg)
                                .show(context);
                          }
                        },
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: const MaterialStatePropertyAll(
                                AppColors.submitBlue),
                            foregroundColor: const MaterialStatePropertyAll(
                                AppColors.white)),
                        child: state is LoginInitial
                            ? const CircularProgressIndicator(
                                color: AppColors.white,
                              )
                            : const Text("SUBMIT",
                                style: TextStyle(fontSize: 18)));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
