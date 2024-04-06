import 'user.dart';

class LoginModel {
  User? user;
  String? token;
  String? errorMessage;
  LoginModel({this.user, this.token, this.errorMessage});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
      user: json['user'] == null
          ? null
          : User.fromJson(Map<String, dynamic>.from(json['user'])),
      token: json['token']?.toString(),
      errorMessage: json['error_message']?.toString());

  Map<String, dynamic> toJson() => {
        if (user != null) 'user': user?.toJson(),
        if (token != null) 'token': token,
        if (errorMessage != null) 'error_message': errorMessage
      };
}
