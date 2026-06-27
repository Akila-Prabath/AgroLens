import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class UploadState {
  final File? image;

  const UploadState({
    this.image,
  });

  UploadState copyWith({
    File? image,
  }) {
    return UploadState(
      image: image ?? this.image,
    );
  }
}

class UploadNotifier extends Notifier<UploadState> {
  final ImagePicker _picker = ImagePicker();

  @override
  UploadState build() {
    return const UploadState();
  }

  Future<File?> pickFromGallery() async {
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 95,
    );

    if (picked == null) {
      return null;
    }

    final file = File(picked.path);

    state = state.copyWith(
      image: file,
    );

    return file;
  }

  void clear() {
    state = const UploadState();
  }
}

final uploadProvider =
    NotifierProvider<UploadNotifier, UploadState>(
  UploadNotifier.new,
);