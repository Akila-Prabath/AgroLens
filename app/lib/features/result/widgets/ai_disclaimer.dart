import 'package:flutter/material.dart';

class AIDisclaimer extends StatelessWidget {
  const AIDisclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// AI Icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF8EC),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.psychology_alt_rounded,
              color: Color(0xFF2E7D32),
              size: 18,
            ),
          ),

          const SizedBox(width: 10),

          /// Text
          const Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  "AI Disclaimer",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "This diagnosis is generated using AgroLens AI and is intended as decision support. "
                  "For severe crop diseases or large-scale farming decisions, consult a qualified agricultural officer or plant pathology expert.",
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.6,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}