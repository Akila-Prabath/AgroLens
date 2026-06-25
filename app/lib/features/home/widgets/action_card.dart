import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isCamera;
  final VoidCallback? onTap;

  const ActionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isCamera,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = isCamera
        ? const Color(0xFF2E7D32)
        : const Color(0xFF1976D2);

    final Color backgroundColor = isCamera
        ? const Color(0xFFF3FAF3)
        : const Color(0xFFF5F9FF);

    final Color borderColor = isCamera
        ? const Color(0xFFDCEEDC)
        : const Color(0xFFDCE8F8);

    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cardWidth = constraints.maxWidth;

          final iconCircle = cardWidth * 0.40;
          final iconSize = cardWidth * 0.16;

          final titleFont = cardWidth * 0.10;
          final subtitleFont = cardWidth * 0.062;

          return AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: EdgeInsets.all(cardWidth * 0.05),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: borderColor, width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: iconCircle,
                    height: iconCircle,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor.withOpacity(0.08),
                      border: Border.all(color: primaryColor.withOpacity(0.15)),
                    ),
                    child: Icon(icon, size: iconSize, color: primaryColor),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: titleFont,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1F2937),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: subtitleFont,
                      color: const Color(0xFF6B7280),
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
