import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

class ImageService {
  final ImagePicker _picker = ImagePicker();

  /// Pick image from gallery
  Future<File?> pickFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );

      if (image == null) {
        return null;
      }

      return File(image.path);
    } catch (e) {
      throw Exception('Failed to pick image: $e');
    }
  }

  /// Capture image using camera
  Future<File?> captureImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 100,
      );

      if (image == null) {
        return null;
      }

      return File(image.path);
    } catch (e) {
      throw Exception('Failed to capture image: $e');
    }
  }

  /// Resize image to the model input size
  img.Image preprocessImage(
    File imageFile, {
    int imageSize = 224,
  }) {
    final Uint8List bytes = imageFile.readAsBytesSync();

    final img.Image? image = img.decodeImage(bytes);

    if (image == null) {
      throw Exception('Unable to decode image.');
    }

    return img.copyResize(
      image,
      width: imageSize,
      height: imageSize,
      interpolation: img.Interpolation.linear,
    );
  }

  /// Convert image to TensorFlow Lite input tensor
  ///
  /// IMPORTANT:
  /// This model was trained using raw RGB values (0-255),
  /// NOT MobileNetV2 preprocessing (-1 to 1).
  List<List<List<double>>> imageToTensor(
    img.Image image,
  ) {
    return List.generate(
      image.height,
      (y) => List.generate(
        image.width,
        (x) {
          final pixel = image.getPixel(x, y);

          return [
            pixel.r.toDouble(),
            pixel.g.toDouble(),
            pixel.b.toDouble(),
          ];
        },
      ),
    );
  }

  /// Complete preprocessing pipeline
  List<List<List<double>>> prepareInputTensor(
    File imageFile,
  ) {
    final resized = preprocessImage(imageFile);

    return imageToTensor(resized);
  }
}