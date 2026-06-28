import 'package:flutter/material.dart';

class PreviewBottomBar extends StatelessWidget {
  final VoidCallback? onRetake;
  final VoidCallback? onAnalyze;

  const PreviewBottomBar({
    super.key,
    this.onRetake,
    this.onAnalyze,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Retake Button
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onRetake,
            icon: const Icon(
              Icons.refresh_rounded,
            ),
            label: const Text(
              "Retake",
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF2E7D32),
              side: const BorderSide(
                color: Color(0xFF2E7D32),
              ),
              minimumSize: const Size.fromHeight(56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        const SizedBox(width: 16),

        /// Analyze Button
        Expanded(
          flex: 2,
          child: ElevatedButton.icon(
            onPressed: onAnalyze,
            icon: const Icon(
              Icons.auto_awesome_rounded,
            ),
            label: const Text(
              "Analyze",
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: const Color(0xFF2E7D32),
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}