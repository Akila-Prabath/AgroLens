import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

/// ======================================================
/// Upload State
/// ======================================================

class UploadState {
  final XFile? image;

  const UploadState({
    this.image,
  });

  UploadState copyWith({
    XFile? image,
  }) {
    return UploadState(
      image: image ?? this.image,
    );
  }
}

/// ======================================================
/// Upload Notifier
/// ======================================================

class UploadNotifier extends Notifier<UploadState> {
  final ImagePicker _picker = ImagePicker();

  @override
  UploadState build() {
    return const UploadState();
  }

  /// Pick image from Gallery
  Future<XFile?> pickFromGallery() async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 95,
      );

      if (picked == null) {
        return null;
      }

      state = state.copyWith(
        image: picked,
      );

      return picked;
    } catch (e) {
      return null;
    }
  }

  /// Pick image from Camera (optional)
  Future<XFile?> pickFromCamera() async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 95,
      );

      if (picked == null) {
        return null;
      }

      state = state.copyWith(
        image: picked,
      );

      return picked;
    } catch (e) {
      return null;
    }
  }

  /// Clear selected image
  void clear() {
    state = const UploadState();
  }
}

/// ======================================================
/// Provider
/// ======================================================

final uploadProvider =
    NotifierProvider<UploadNotifier, UploadState>(
  UploadNotifier.new,
);