import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/camera_provider.dart';
import '../widgets/camera_controls.dart';
import '../widgets/camera_header.dart';
import '../widgets/camera_overlay.dart';
import '../widgets/tip_banner.dart';
import '../widgets/zoom_controls.dart';

class CameraScreen extends ConsumerStatefulWidget {
  const CameraScreen({super.key});

  @override
  ConsumerState<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends ConsumerState<CameraScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(cameraProvider.notifier).initializeCamera();
    });
  }

  @override
  void dispose() {
    ref.read(cameraProvider.notifier).disposeCamera();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cameraState = ref.watch(cameraProvider);

    final CameraController? controller = cameraState.controller;

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            /// Header
            const CameraHeader(),

            /// Camera Area
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final previewHeight = constraints.maxHeight;

                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      /// ===============================
                      /// Live Camera Preview
                      /// ===============================
                      if (cameraState.isInitialized &&
                          controller != null &&
                          controller.value.isInitialized)
                        ClipRect(
                          child: OverflowBox(
                            alignment: Alignment.center,
                            maxWidth: double.infinity,
                            maxHeight: double.infinity,
                            child: AspectRatio(
                              aspectRatio: controller.value.aspectRatio,
                              child: CameraPreview(controller),
                            ),
                          ),
                        )
                      else
                        Container(
                          color: Colors.black,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),

                      /// ===============================
                      /// Scanner Overlay
                      /// ===============================
                      const CameraOverlay(),

                      /// ===============================
                      /// Zoom Controls
                      /// ===============================
                      Positioned(
                        right: 16,
                        top: previewHeight * 0.26,
                        child: ZoomControls(
                          zoomLevel: cameraState.zoomLevel,
                          isFlashOn: cameraState.isFlashOn,
                          onZoomIn: () {
                            ref.read(cameraProvider.notifier).zoomIn();
                          },
                          onZoomOut: () {
                            ref.read(cameraProvider.notifier).zoomOut();
                          },
                          onFlashToggle: () {
                            ref.read(cameraProvider.notifier).toggleFlash();
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            /// Bottom Controls
            Container(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [TipBanner(), SizedBox(height: 22), CameraControls()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
