import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:test_minpro_insta/constants.dart';

class PostRepository {
  ///
  Future<File?> pickImage({required UploadType type}) async {
    final imagePicker = ImagePicker();

    if (type == UploadType.GALLERY) {
      final pickedImage = await imagePicker.pickImage(
        source: ImageSource.gallery,
      );

      return (pickedImage != null) ? File(pickedImage.path) : null;
    } else {
      final pickedImage = await imagePicker.pickImage(
        source: ImageSource.camera,
      );

      return (pickedImage != null) ? File(pickedImage.path) : null;
    }
  }
}
