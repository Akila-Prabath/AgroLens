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
  const CameraScreen({
    super.key,
  });

  @override
  ConsumerState<CameraScreen> createState() =>
      _CameraScreenState();
}

class _CameraScreenState
    extends ConsumerState<CameraScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(cameraProvider.notifier)
          .initializeCamera();
    });
  }

  @override
  void dispose() {
    ref
        .read(cameraProvider.notifier)
        .disposeCamera();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cameraState = ref.watch(cameraProvider);

    final CameraController? controller =
        cameraState.controller;

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            /// Header
            const CameraHeader(),

            /// Camera Preview
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [

                  /// Live Camera
                  if (cameraState.isInitialized &&
                      controller != null &&
                      controller.value.isInitialized)

                    FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: controller
                            .value
                            .previewSize!
                            .height,
                        height: controller
                            .value
                            .previewSize!
                            .width,
                        child: CameraPreview(
                          controller,
                        ),
                      ),
                    )

                  else

                    Container(
                      color: Colors.black,
                      child: const Center(
                        child:
                            CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    ),

                  /// Focus Overlay
                  const CameraOverlay(),

                  /// Zoom + Flash Controls
                  const Positioned(
                    right: 18,
                    top: 140,
                    child: ZoomControls(),
                  ),
                ],
              ),
            ),

            /// Bottom Panel
            Container(
              padding:
                  const EdgeInsets.fromLTRB(
                20,
                18,
                20,
                24,
              ),
              decoration:
                  const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(
                  top: Radius.circular(28),
                ),
              ),
              child: const Column(
                mainAxisSize:
                    MainAxisSize.min,
                children: [

                  TipBanner(),

                  SizedBox(height: 22),

                  CameraControls(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}