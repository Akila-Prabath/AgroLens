import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/camera_provider.dart';

class CameraControls extends ConsumerWidget {
  const CameraControls({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final sideButton = width * 0.20;
        final captureButton = width * 0.26;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                /// Gallery
                _ActionButton(
                  size: sideButton,
                  icon: Icons.image_outlined,
                  label: "Gallery",
                  onTap: () async {
                    await ref
                        .read(
                          cameraProvider.notifier,
                        )
                        .pickFromGallery();
                  },
                ),

                /// Capture
                Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final image =
                            await ref
                                .read(
                                  cameraProvider
                                      .notifier,
                                )
                                .captureImage();

                        if (image != null &&
                            context.mounted) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Image captured successfully",
                              ),
                              behavior:
                                  SnackBarBehavior
                                      .floating,
                            ),
                          );

                          // TODO:
                          // Navigate to Preview Screen
                        }
                      },

                      child: Container(
                        width: captureButton,
                        height: captureButton,
                        decoration:
                            BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color:
                                const Color(
                                  0xFF2E7D32,
                                ),
                            width: 3,
                          ),
                        ),

                        child: Center(
                          child: Container(
                            width:
                                captureButton *
                                .82,
                            height:
                                captureButton *
                                .82,
                            decoration:
                                const BoxDecoration(
                                  shape:
                                      BoxShape.circle,
                                  color: Color(
                                    0xFF2E7D32,
                                  ),
                                ),

                            child: const Icon(
                              Icons
                                  .camera_alt_rounded,
                              color:
                                  Colors.white,
                              size: 36,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    const Text(
                      "Tap to Capture",
                      style: TextStyle(
                        fontWeight:
                            FontWeight.w500,
                        fontSize: 16,
                        color: Color(
                          0xFF374151,
                        ),
                      ),
                    ),
                  ],
                ),

                /// Flip Camera
                _ActionButton(
                  size: sideButton,
                  icon:
                      Icons
                          .cameraswitch_outlined,
                  label: "Flip Camera",
                  onTap: () async {
                    await ref
                        .read(
                          cameraProvider.notifier,
                        )
                        .switchCamera();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _ActionButton extends StatelessWidget {
  final double size;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.size,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius:
              BorderRadius.circular(100),
          onTap: onTap,

          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: const Color(
                  0xFFE5E7EB,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(
                    0,
                    4,
                  ),
                ),
              ],
            ),

            child: Icon(
              icon,
              color: const Color(
                0xFF374151,
              ),
              size: size * .38,
            ),
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF4B5563),
            fontWeight:
                FontWeight.w500,
          ),
        ),
      ],
    );
  }
}