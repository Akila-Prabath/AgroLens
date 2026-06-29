import 'package:flutter/material.dart';

class CropInfoCard extends StatelessWidget {
  final String cropName;
  final String growthStage;
  final String severity;
  final String description;

  const CropInfoCard({
    super.key,
    required this.cropName,
    required this.growthStage,
    required this.severity,
    required this.description,
  });

  Color get _severityColor {
    switch (severity.toLowerCase()) {
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

  Color get _severityBackground {
    switch (severity.toLowerCase()) {
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
      padding: const EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            "Crop Information",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),

          const SizedBox(height: 18),

          Row(
            children: [
              Expanded(
                child: _InfoItem(
                  icon: Icons.eco_rounded,
                  title: "Crop",
                  value: cropName,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _InfoItem(
                  icon: Icons.spa_rounded,
                  title: "Growth Stage",
                  value: growthStage,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Row(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: _severityBackground,
                  borderRadius:
                      BorderRadius.circular(14),
                ),
                child: Icon(
                  Icons.warning_amber_rounded,
                  color: _severityColor,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Disease Severity",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF6B7280),
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      severity,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight:
                            FontWeight.bold,
                        color: _severityColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Divider(),

          const SizedBox(height: 16),

          const Text(
            "Description",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              height: 1.6,
              color: Color(0xFF4B5563),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAF8),
        borderRadius:
            BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF8EC),
              borderRadius:
                  BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF168A2F),
              size: 22,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF6B7280),
            ),
          ),

          const SizedBox(height: 4),

          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
        ],
      ),
    );
  }
}