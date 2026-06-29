import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../camera/widgets/camera_header.dart';
import '../../home/widgets/home_bottom_nav.dart';
import '../../recommendation/presentation/recommendation_screen.dart';
import '../providers/result_provider.dart';
import '../widgets/ai_disclaimer.dart';
import '../widgets/cause_card.dart';
import '../widgets/crop_info_card.dart';
import '../widgets/recommendation_banner.dart';
import '../widgets/result_action_bar.dart';
import '../widgets/result_image_card.dart';
import '../widgets/symptom_card.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(resultProvider);

    /// Loading
    if (result.isLoading) {
      return const Scaffold(
        backgroundColor: Color(0xFFF8F9FA),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    /// Error
    if (result.error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Analysis Result")),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              result.error!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
        ),
      );
    }

    /// No prediction yet
    if (result.prediction == null || result.disease == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Analysis Result")),
        body: const Center(child: Text("No analysis result available.")),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              const CameraHeader(title: "Analysis Result", showBack: true),

              const SizedBox(height: 22),

              /// Prediction Card
              ResultImageCard(
                imagePath: result.imagePath,
                diseaseName: result.diseaseName,
                scientificName: result.scientificName,
                confidence: result.confidence,
                riskLevel: result.severity,
              ),

              const SizedBox(height: 18),

              /// Symptoms
              SymptomCard(symptoms: result.symptoms, onViewMore: () {}),

              const SizedBox(height: 18),

              /// Causes
              CauseCard(causes: result.causes, onViewMore: () {}),

              const SizedBox(height: 18),

              /// Crop Information
              CropInfoCard(
                cropName: result.cropName,
                growthStage: result.growthStage,
                severity: result.severity,
                description: result.description,
              ),

              const SizedBox(height: 18),

              /// Recommendation
              RecommendationBanner(
                diseaseName: result.diseaseName,
                fertilizerCount: result.fertilizers.length,
                chemicalCount: result.chemicals.length,
                preventionCount: result.prevention.length,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RecommendationScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 18),

              /// AI Disclaimer
              const AIDisclaimer(),

              const SizedBox(height: 22),

              /// Actions
              ResultActionBar(
                onAnalyzeAgain: () {
                  ref.read(resultProvider.notifier).clear();

                  Navigator.popUntil(context, (route) => route.isFirst);
                },

                onSave: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Save to history will be implemented next.",
                      ),
                    ),
                  );
                },

                onShare: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Share feature will be implemented next."),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: const HomeBottomNav(currentIndex: 2),
    );
  }
}
