import 'package:flutter/material.dart';

class ResultActionBar extends StatelessWidget {
  final VoidCallback? onAnalyzeAgain;
  final VoidCallback? onSave;
  final VoidCallback? onShare;

  const ResultActionBar({
    super.key,
    this.onAnalyzeAgain,
    this.onSave,
    this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Analyze Another
        SizedBox(
          width: double.infinity,
          height: 38,
          child: ElevatedButton.icon(
            onPressed: onAnalyzeAgain,
            icon: const Icon(
              Icons.camera_alt_rounded,
              size: 16,
            ),
            label: const Text(
              "Analyze Another Image",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: const Color(0xFF2E7D32),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        /// Save + Share
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onSave,
                icon: const Icon(Icons.bookmark_border_rounded),
                label: const Text("Save"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF2E7D32),
                  side: const BorderSide(
                    color: Color(0xFF2E7D32),
                  ),
                  minimumSize: const Size.fromHeight(38),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: OutlinedButton.icon(
                onPressed: onShare,
                icon: const Icon(Icons.share_rounded),
                label: const Text("Share"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF2E7D32),
                  side: const BorderSide(
                    color: Color(0xFF2E7D32),
                  ),
                  minimumSize: const Size.fromHeight(38),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}