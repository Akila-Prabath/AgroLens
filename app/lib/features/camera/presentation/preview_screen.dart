import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../analysis/presentation/analysis_screen.dart';
import '../widgets/preview_bottom_bar.dart';

class PreviewScreen extends StatelessWidget {
  final String imagePath;

  const PreviewScreen({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Stack(
        children: [
          /// Image Preview
          Positioned.fill(
            child: Hero(
              tag: imagePath,
              child: Image.file(
                File(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Dark Gradient
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x66000000),
                    Colors.transparent,
                    Colors.transparent,
                    Color(0xCC000000),
                  ],
                  stops: [
                    0.0,
                    0.25,
                    0.65,
                    1.0,
                  ],
                ),
              ),
            ),
          ),

          /// Back Button
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.black45,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () => context.pop(),
                  ),
                ),
              ),
            ),
          ),

          /// Bottom Sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                24,
                24,
                24,
                30,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  /// Handle
                  const Center(
                    child: SizedBox(
                      width: 55,
                      child: Divider(
                        thickness: 4,
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// Title
                  const Text(
                    "Ready for Analysis",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// Description
                  const Text(
                    "Ensure the affected leaf is clearly visible before starting the AI analysis.",
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Color(0xFF6B7280),
                    ),
                  ),

                  const SizedBox(height: 28),

                  /// Bottom Buttons
                  PreviewBottomBar(
                    onRetake: () {
                      context.pop();
                    },
                    onAnalyze: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AnalysisScreen(
                            image: XFile(imagePath),
                          ),
                        ),
                      );
                    },
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