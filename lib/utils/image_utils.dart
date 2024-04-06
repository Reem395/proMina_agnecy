import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImageUtils {
  static final ImagePicker _imagePicker = ImagePicker();
  static XFile? pickedImage;
  

  static Future<Uint8List?> pickImage({required ImageSource source}) async {
    try {
      pickedImage = await _imagePicker.pickImage(source: source);
      if (pickedImage != null) {
        final bytes = await pickedImage?.readAsBytes();
        return bytes;
      } 
    } catch (e) {
      print("Image error: $e");
    }
    return null;
  }
}