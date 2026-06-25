import 'package:flutter/material.dart';

class DetectionCard extends StatelessWidget {
  final String imagePath;
  final String diseaseName;
  final String cropName;
  final String date;
  final String riskLabel;
  final String confidence;
  final Color riskColor;
  final VoidCallback? onTap;

  const DetectionCard({
    super.key,
    required this.imagePath,
    required this.diseaseName,
    required this.cropName,
    required this.date,
    required this.riskLabel,
    required this.confidence,
    required this.riskColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cardWidth = constraints.maxWidth;

          final imageSize = cardWidth * 0.22;
          final padding = cardWidth * 0.035;

          final diseaseFont = cardWidth * 0.045;
          final normalFont = cardWidth * 0.037;
          final smallFont = cardWidth * 0.032;
          final confidenceFont = cardWidth * 0.065;

          return Container(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 4),
                ),
              ],
            ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Disease Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagePath,
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(width: padding),

                /// Disease Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        diseaseName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: diseaseFont,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF111827),
                        ),
                      ),

                      SizedBox(height: padding * 0.6),

                      Row(
                        children: [
                          Icon(
                            Icons.eco,
                            size: normalFont + 2,
                            color: const Color(0xFF2E7D32),
                          ),

                          const SizedBox(width: 4),

                          Expanded(
                            child: Text(
                              cropName,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: normalFont,
                                color: const Color(0xFF6B7280),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: padding * 0.6),

                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: normalFont + 2,
                            color: const Color(0xFF6B7280),
                          ),

                          const SizedBox(width: 4),

                          Expanded(
                            child: Text(
                              date,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: smallFont,
                                color: const Color(0xFF6B7280),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(width: padding),

                /// Right Section
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: padding,
                        vertical: padding * 0.45,
                      ),
                      decoration: BoxDecoration(
                        color: riskColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        riskLabel,
                        style: TextStyle(
                          color: riskColor,
                          fontWeight: FontWeight.w600,
                          fontSize: smallFont,
                        ),
                      ),
                    ),

                    SizedBox(height: padding * 0.7),

                    Text(
                      confidence,
                      style: TextStyle(
                        fontSize: confidenceFont,
                        fontWeight: FontWeight.bold,
                        color: riskColor,
                      ),
                    ),

                    Text(
                      'Confidence',
                      style: TextStyle(
                        color: const Color(0xFF6B7280),
                        fontSize: smallFont,
                      ),
                    ),
                  ],
                ),

                SizedBox(width: padding * 0.5),

                Icon(
                  Icons.chevron_right,
                  color: const Color(0xFF9CA3AF),
                  size: cardWidth * 0.06,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}