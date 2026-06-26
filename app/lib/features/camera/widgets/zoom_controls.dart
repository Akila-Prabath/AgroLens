import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/camera_provider.dart';

class ZoomControls extends ConsumerWidget {
  const ZoomControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameraState = ref.watch(cameraProvider);
    final notifier = ref.read(cameraProvider.notifier);

    return Container(
      width: 72,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.45),
        borderRadius: BorderRadius.circular(36),
        border: Border.all(
          color: Colors.white24,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Zoom +
          _CircleButton(
            icon: Icons.add,
            onTap: notifier.zoomIn,
          ),

          const SizedBox(height: 16),

          Text(
            "${cameraState.zoomLevel.toStringAsFixed(1)}x",
            style: const TextStyle(
              color: Color(0xFF4CAF50),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 16),

          /// Zoom -
          _CircleButton(
            icon: Icons.remove,
            onTap: notifier.zoomOut,
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(
              color: Colors.white24,
              thickness: 1,
              indent: 14,
              endIndent: 14,
            ),
          ),

          /// Flash
          InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: notifier.toggleFlash,
            child: Column(
              children: [
                Icon(
                  cameraState.isFlashOn
                      ? Icons.flash_on_rounded
                      : Icons.flash_off_rounded,
                  color: cameraState.isFlashOn
                      ? Colors.amber
                      : Colors.white,
                  size: 26,
                ),

                const SizedBox(height: 6),

                const Text(
                  "Flash",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: SizedBox(
        width: 40,
        height: 40,
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }
}