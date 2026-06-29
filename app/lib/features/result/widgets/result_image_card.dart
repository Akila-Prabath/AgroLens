import 'dart:io';

import 'package:flutter/material.dart';

class ResultImageCard extends StatelessWidget {
  final String? imagePath;
  final String diseaseName;
  final String scientificName;
  final double confidence;
  final String riskLevel;

  const ResultImageCard({
    super.key,
    required this.imagePath,
    required this.diseaseName,
    required this.scientificName,
    required this.confidence,
    required this.riskLevel,
  });

  bool get _isHealthy =>
      diseaseName.toLowerCase().contains("healthy");

  Color get _riskColor {
    switch (riskLevel.toLowerCase()) {
      case "high":
        return Colors.red;

      case "medium":
        return Colors.orange;

      case "low":
        return Colors.green;

      default:
        return const Color(0xFF2E7D32);
    }
  }

  Color get _riskBackground {
    switch (riskLevel.toLowerCase()) {
      case "high":
        return const Color(0xFFFFEBEE);

      case "medium":
        return const Color(0xFFFFF3E0);

      case "low":
        return const Color(0xFFE8F5E9);

      default:
        return const Color(0xFFE8F5E9);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: AspectRatio(
                aspectRatio: 1,
                child: imagePath != null
                    ? Image.file(
                        File(imagePath!),
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        "assets/images/healthy_leaf.jpg",
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),

          const SizedBox(width: 14),

          /// Details
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                /// Disease Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: _isHealthy
                        ? const Color(0xFFE8F5E9)
                        : const Color(0xFFFFEBEE),
                    borderRadius:
                        BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _isHealthy
                            ? Icons.check_circle
                            : Icons.warning_rounded,
                        size: 14,
                        color: _isHealthy
                            ? Colors.green
                            : Colors.red,
                      ),

                      const SizedBox(width: 6),

                      Text(
                        _isHealthy
                            ? "Healthy Leaf"
                            : "Disease Detected",
                        style: TextStyle(
                          color: _isHealthy
                              ? Colors.green
                              : Colors.red,
                          fontWeight:
                              FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                /// Disease Name
                Text(
                  diseaseName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),

                const SizedBox(height: 6),

                /// Scientific Name
                Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.eco_rounded,
                      size: 16,
                      color: Color(0xFF2E7D32),
                    ),

                    const SizedBox(width: 6),

                    Expanded(
                      child: Text(
                        scientificName,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF6B7280),
                          fontStyle:
                              FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                /// Confidence
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Confidence",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF4B5563),
                      ),
                    ),

                    Text(
                      "${confidence.toStringAsFixed(1)}%",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF168A2F),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(12),
                  child: LinearProgressIndicator(
                    value: confidence / 100,
                    minHeight: 8,
                    backgroundColor:
                        const Color(0xFFE5E7EB),
                    valueColor:
                        const AlwaysStoppedAnimation(
                      Color(0xFF168A2F),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                const Text(
                  "Severity",
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF4B5563),
                  ),
                ),

                const SizedBox(height: 8),

                Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: _riskBackground,
                    borderRadius:
                        BorderRadius.circular(12),
                  ),
                  child: Text(
                    riskLevel,
                    style: TextStyle(
                      color: _riskColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
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