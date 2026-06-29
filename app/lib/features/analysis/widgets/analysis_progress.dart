import 'package:flutter/material.dart';

class AnalysisProgress extends StatelessWidget {
  final double progress;

  const AnalysisProgress({
    super.key,
    this.progress = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final percent = (progress * 100).clamp(0, 100);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Top Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "AI Analysis Progress",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2937),
              ),
            ),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: Text(
                "${percent.toInt()}%",
                key: ValueKey(percent),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E7D32),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        /// Progress Bar
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 300),
            tween: Tween(
              begin: 0,
              end: progress,
            ),
            builder: (context, value, child) {
              return LinearProgressIndicator(
                value: value,
                minHeight: 12,
                backgroundColor: const Color(0xFFE8F5E9),
                valueColor: const AlwaysStoppedAnimation(
                  Color(0xFF2E7D32),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        /// Status Text
        Row(
          children: [
            const SizedBox(
              width: 12,
              height: 12,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: Color(0xFF2E7D32),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  _status(progress),
                  key: ValueKey(_status(progress)),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _status(double progress) {
    if (progress < 0.20) {
      return "Processing uploaded image...";
    }

    if (progress < 0.50) {
      return "Detecting crop type...";
    }

    if (progress < 0.70) {
      return "Identifying leaf disease...";
    }
    
    if (progress < 1.0) {
      return "Generating recommendations...";
    }

    return "Analysis completed.";
  }
}