import 'package:flutter/material.dart';

class ZoomControls extends StatelessWidget {
  final double zoomLevel;
  final bool isFlashOn;

  final VoidCallback? onZoomIn;
  final VoidCallback? onZoomOut;
  final VoidCallback? onFlashToggle;

  const ZoomControls({
    super.key,
    required this.zoomLevel,
    this.isFlashOn = false,
    this.onZoomIn,
    this.onZoomOut,
    this.onFlashToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.45),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white24,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Zoom In
          _CircleButton(
            icon: Icons.add,
            onTap: onZoomIn,
          ),

          const SizedBox(height: 8),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Text(
              "${zoomLevel.toStringAsFixed(1)}x",
              key: ValueKey(zoomLevel),
              style: const TextStyle(
                color: Color(0xFF4CAF50),
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          const SizedBox(height: 8),

          /// Zoom Out
          _CircleButton(
            icon: Icons.remove,
            onTap: onZoomOut,
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(
              color: Colors.white24,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
          ),

          /// Flash
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: onFlashToggle,
            child: Column(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    isFlashOn
                        ? Icons.flash_on_rounded
                        : Icons.flash_off_rounded,
                    key: ValueKey(isFlashOn),
                    color: isFlashOn
                        ? Colors.amber
                        : Colors.white,
                    size: 22,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  isFlashOn ? "On" : "Flash",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
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
  final VoidCallback? onTap;

  const _CircleButton({
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: SizedBox(
        width: 32,
        height: 32,
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: 22,
          ),
        ),
      ),
    );
  }
}