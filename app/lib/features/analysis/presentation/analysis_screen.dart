import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../camera/widgets/camera_header.dart';
import '../../result/presentation/result_screen.dart';
import '../../result/providers/result_provider.dart';
import '../providers/analysis_provider.dart';
import '../widgets/analysis_image_card.dart';
import '../widgets/analysis_progress.dart';
import '../widgets/analysis_status.dart';

class AnalysisScreen extends ConsumerStatefulWidget {
  final XFile image;

  const AnalysisScreen({
    super.key,
    required this.image,
  });

  @override
  ConsumerState<AnalysisScreen> createState() =>
      _AnalysisScreenState();
}

class _AnalysisScreenState
    extends ConsumerState<AnalysisScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(analysisProvider.notifier).startAnalysis(
            File(widget.image.path),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final analysisState =
        ref.watch(analysisProvider);

    ref.listen<AnalysisState>(
      analysisProvider,
      (previous, next) {
        /// Show errors
        if (next.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next.error!),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }

        /// Analysis completed
        if (next.isCompleted &&
            next.prediction != null &&
            next.disease != null) {
          ref.read(resultProvider.notifier).setResult(
                imagePath: widget.image.path,
                prediction: next.prediction!,
                disease: next.disease!,
              );

          Future.delayed(
            const Duration(milliseconds: 500),
            () {
              if (!mounted) return;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const ResultScreen(),
                ),
              );
            },
          );
        }
      },
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            20,
            12,
            20,
            18,
          ),
          child: Column(
            children: [
              /// Header
              const CameraHeader(
                title: "AI Analysis",
                showBack: false,
              ),

              const SizedBox(height: 18),

              const Text(
                "Analyzing Your Leaf",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Our AI is identifying the disease.\nPlease wait a few seconds.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  color: Color(0xFF6B7280),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 18),

              /// Uploaded Image
              AnalysisImageCard(
                image: widget.image,
              ),

              const SizedBox(height: 22),

              /// Progress
              AnalysisProgress(
                progress: analysisState.progress,
              ),

              const SizedBox(height: 22),

              /// Status
              AnalysisStatus(
                currentStep:
                    analysisState.currentStep,
              ),

              const SizedBox(height: 28),

              AnimatedSwitcher(
                duration:
                    const Duration(milliseconds: 300),
                child: analysisState.isCompleted
                    ? const Icon(
                        Icons.check_circle_rounded,
                        key: ValueKey("done"),
                        color: Color(0xFF2E7D32),
                        size: 34,
                      )
                    : const SizedBox(
                        key: ValueKey("loading"),
                        width: 34,
                        height: 34,
                        child:
                            CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
              ),

              const SizedBox(height: 16),

              Text(
                analysisState.isCompleted
                    ? "Analysis Completed"
                    : "Powered by AgroLens AI",
                style: const TextStyle(
                  color: Color(0xFF6B7280),
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}