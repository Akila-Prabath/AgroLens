import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageService {
  final ImagePicker _picker =
      ImagePicker();

  Future<File?> pickFromGallery()
      async {
    try {
      final XFile? image =
          await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );

      if (image == null) {
        return null;
      }

      return File(image.path);
    } catch (e) {
      throw Exception(
        'Failed to pick image: $e',
      );
    }
  }

  Future<File?> captureImage()
      async {
    try {
      final XFile? image =
          await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 100,
      );

      if (image == null) {
        return null;
      }

      return File(image.path);
    } catch (e) {
      throw Exception(
        'Failed to capture image: $e',
      );
    }
  }
}