import 'data.dart';

class GalleryModel {
  String? status;
  Gallery? data;
  String? message;

  GalleryModel({this.status, this.data, this.message});

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
        status: json['status']?.toString(),
        data: json['data'] == null
            ? null
            : Gallery.fromJson(Map<String, dynamic>.from(json['data'])),
        message: json['message']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (status != null) 'status': status,
        if (data != null) 'data': data?.toJson(),
        if (message != null) 'message': message,
      };
}
