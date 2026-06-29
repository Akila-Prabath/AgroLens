import 'package:flutter/material.dart';

class RecommendationBanner extends StatelessWidget {
  final VoidCallback? onPressed;

  final String diseaseName;

  final int fertilizerCount;
  final int chemicalCount;
  final int preventionCount;

  const RecommendationBanner({
    super.key,
    this.onPressed,
    required this.diseaseName,
    required this.fertilizerCount,
    required this.chemicalCount,
    required this.preventionCount,
  });

  bool get _isHealthy =>
      diseaseName.toLowerCase().contains("healthy");

  @override
  Widget build(BuildContext context) {
    final totalRecommendations =
        fertilizerCount +
        chemicalCount +
        preventionCount;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF2E7D32),
            Color(0xFF43A047),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(.25),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          /// Icon
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.18),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _isHealthy
                  ? Icons.check_circle_rounded
                  : Icons.health_and_safety_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),

          const SizedBox(height: 18),

          Text(
            _isHealthy
                ? "Healthy Crop Tips"
                : "Recommended Treatment",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            _isHealthy
                ? "Your crop appears healthy.\nView best farming practices to maintain crop health."
                : "$totalRecommendations AI-powered recommendations are available for treating this disease, including fertilizers, chemicals, and prevention tips.",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.15),
              borderRadius:
                  BorderRadius.circular(14),
            ),
            child: Text(
              _isHealthy
                  ? "Best Practices"
                  : "$totalRecommendations Recommendations",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton.icon(
              onPressed: onPressed,
              icon: const Icon(
                Icons.arrow_forward_rounded,
              ),
              label: Text(
                _isHealthy
                    ? "View Best Practices"
                    : "View Recommendations",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor:
                    const Color(0xFF2E7D32),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}