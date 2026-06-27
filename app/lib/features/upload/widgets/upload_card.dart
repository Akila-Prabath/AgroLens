import 'package:flutter/material.dart';

class UploadCard extends StatelessWidget {
  final String imagePath;
  final String diseaseName;
  final String cropName;
  final String date;
  final VoidCallback? onTap;

  const UploadCard({
    super.key,
    required this.imagePath,
    required this.diseaseName,
    required this.cropName,
    required this.date,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 150,
        child: Card(
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.06),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    imagePath,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 8),

                /// Disease Name
                Text(
                  diseaseName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                    height: 1.2,
                  ),
                ),

                const SizedBox(height: 6),

                /// Crop
                Row(
                  children: [
                    const Icon(
                      Icons.eco,
                      size: 14,
                      color: Color(0xFF2E7D32),
                    ),

                    const SizedBox(width: 4),

                    Expanded(
                      child: Text(
                        cropName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                /// Date
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 13,
                      color: Color(0xFF6B7280),
                    ),

                    const SizedBox(width: 4),

                    Expanded(
                      child: Text(
                        date,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}