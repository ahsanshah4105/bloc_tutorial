import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickImageFromGallery() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }

  Future<XFile?> cameraCapture() async {
    return await _picker.pickImage(source: ImageSource.camera);
  }

}

