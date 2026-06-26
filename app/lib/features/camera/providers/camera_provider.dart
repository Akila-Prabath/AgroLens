import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

/// =======================================================
/// Camera State
/// =======================================================

class CameraState {
  final CameraController? controller;
  final bool isInitialized;
  final bool isFlashOn;
  final double zoomLevel;
  final int selectedCameraIndex;
  final List<CameraDescription> cameras;

  const CameraState({
    this.controller,
    this.isInitialized = false,
    this.isFlashOn = false,
    this.zoomLevel = 1.0,
    this.selectedCameraIndex = 0,
    this.cameras = const [],
  });

  CameraState copyWith({
    CameraController? controller,
    bool? isInitialized,
    bool? isFlashOn,
    double? zoomLevel,
    int? selectedCameraIndex,
    List<CameraDescription>? cameras,
  }) {
    return CameraState(
      controller: controller ?? this.controller,
      isInitialized: isInitialized ?? this.isInitialized,
      isFlashOn: isFlashOn ?? this.isFlashOn,
      zoomLevel: zoomLevel ?? this.zoomLevel,
      selectedCameraIndex:
          selectedCameraIndex ??
          this.selectedCameraIndex,
      cameras: cameras ?? this.cameras,
    );
  }
}

/// =======================================================
/// Camera Notifier
/// =======================================================

class CameraNotifier extends Notifier<CameraState> {
  final ImagePicker _picker = ImagePicker();

  bool _initializing = false;

  @override
  CameraState build() {
    ref.onDispose(() async {
      await state.controller?.dispose();
    });

    return const CameraState();
  }

  /// -------------------------------------------------------
  /// Initialize Camera
  /// -------------------------------------------------------

  Future<void> initializeCamera() async {
    if (_initializing) return;

    _initializing = true;

    try {
      final cameras = await availableCameras();

      if (cameras.isEmpty) {
        _initializing = false;
        return;
      }

      await state.controller?.dispose();

      final controller = CameraController(
        cameras.first,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await controller.initialize();

      await controller.setFlashMode(
        FlashMode.off,
      );

      await controller.setZoomLevel(1.0);

      state = state.copyWith(
        controller: controller,
        cameras: cameras,
        isInitialized: true,
        zoomLevel: 1.0,
        isFlashOn: false,
        selectedCameraIndex: 0,
      );
    } catch (e) {
      debugPrint(
        "Camera initialization failed: $e",
      );
    }

    _initializing = false;
  }

  /// -------------------------------------------------------
  /// Switch Camera
  /// -------------------------------------------------------

  Future<void> switchCamera() async {
    if (state.cameras.length < 2) return;

    try {
      final next =
          state.selectedCameraIndex == 0
              ? 1
              : 0;

      await state.controller?.dispose();

      final controller = CameraController(
        state.cameras[next],
        ResolutionPreset.high,
        enableAudio: false,
      );

      await controller.initialize();

      await controller.setFlashMode(
        FlashMode.off,
      );

      await controller.setZoomLevel(1.0);

      state = state.copyWith(
        controller: controller,
        selectedCameraIndex: next,
        zoomLevel: 1.0,
        isFlashOn: false,
        isInitialized: true,
      );
    } catch (e) {
      debugPrint(
        "Switch Camera Error: $e",
      );
    }
  }

  /// -------------------------------------------------------
  /// Capture Image
  /// -------------------------------------------------------

  Future<XFile?> captureImage() async {
    try {
      final controller = state.controller;

      if (controller == null) return null;

      if (!controller.value.isInitialized) {
        return null;
      }

      if (controller.value.isTakingPicture) {
        return null;
      }

      return await controller.takePicture();
    } catch (e) {
      debugPrint(
        "Capture Error: $e",
      );
      return null;
    }
  }

  /// -------------------------------------------------------
  /// Gallery Picker
  /// -------------------------------------------------------

  Future<XFile?> pickFromGallery() async {
    try {
      final image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 95,
      );

      return image;
    } catch (e) {
      debugPrint(
        "Gallery Error: $e",
      );
      return null;
    }
  }

  /// -------------------------------------------------------
  /// Flash
  /// -------------------------------------------------------

  Future<void> toggleFlash() async {
    final controller = state.controller;

    if (controller == null) return;

    try {
      final flash =
          !state.isFlashOn;

      await controller.setFlashMode(
        flash
            ? FlashMode.torch
            : FlashMode.off,
      );

      state = state.copyWith(
        isFlashOn: flash,
      );
    } catch (e) {
      debugPrint(
        "Flash Error: $e",
      );
    }
  }

  /// -------------------------------------------------------
  /// Set Zoom
  /// -------------------------------------------------------

  Future<void> setZoom(
    double zoom,
  ) async {
    final controller = state.controller;

    if (controller == null) return;

    try {
      final minZoom =
          await controller.getMinZoomLevel();

      final maxZoom =
          await controller.getMaxZoomLevel();

      final newZoom = zoom.clamp(
        minZoom,
        maxZoom,
      );

      await controller.setZoomLevel(
        newZoom,
      );

      state = state.copyWith(
        zoomLevel: newZoom,
      );
    } catch (e) {
      debugPrint(
        "Zoom Error: $e",
      );
    }
  }

  Future<void> zoomIn() async {
    await setZoom(
      state.zoomLevel + 0.5,
    );
  }

  Future<void> zoomOut() async {
    await setZoom(
      state.zoomLevel - 0.5,
    );
  }

  /// -------------------------------------------------------
  /// Dispose
  /// -------------------------------------------------------

  Future<void> disposeCamera() async {
    await state.controller?.dispose();

    state = const CameraState();
  }
}

/// =======================================================
/// Provider
/// =======================================================

final cameraProvider =
    NotifierProvider<
      CameraNotifier,
      CameraState
    >(CameraNotifier.new);