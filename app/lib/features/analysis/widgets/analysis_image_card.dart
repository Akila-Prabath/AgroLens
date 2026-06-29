import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AnalysisImageCard extends StatelessWidget {
  final XFile image;

  const AnalysisImageCard({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          /// Leaf Image
          ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Image.file(
              File(image.path),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          /// Gradient Overlay
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(.10),
                    Colors.transparent,
                    Colors.black.withOpacity(.25),
                  ],
                ),
              ),
            ),
          ),

          /// AI Badge
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF2E7D32),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.auto_awesome,
                    color: Colors.white,
                    size: 14,
                  ),

                  SizedBox(width: 6),

                  Text(
                    "AI",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Bottom Label
          Positioned(
            left: 18,
            bottom: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.45),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.eco,
                    color: Colors.white,
                    size: 14,
                  ),

                  SizedBox(width: 8),

                  Text(
                    "Uploaded Leaf Image",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}