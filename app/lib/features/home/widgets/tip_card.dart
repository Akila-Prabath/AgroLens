import 'package:flutter/material.dart';

class TipCard extends StatelessWidget {
  const TipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final cardHeight = width * 0.32;
        final iconSize = width * 0.14;
        final imageWidth = width * 0.28;

        return Container(
          height: cardHeight,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFFF7FCF7), Color(0xFFF1F8F3)],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 14,
                offset: const Offset(0, 5),
              ),
            ],
          ),

          child: Row(
            children: [
              /// LEFT SIDE
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: iconSize,
                      height: iconSize,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF2E7D32).withOpacity(0.12),
                            blurRadius: 14,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.tips_and_updates_rounded,
                          color: const Color(0xFF2E7D32),
                          size: iconSize * 0.52,
                        ),
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Tip",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2E7D32),
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            "Use clear images in good lighting for better and accurate results.",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey.shade700,
                              height: 1.25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 10),

              /// RIGHT ILLUSTRATION
              Image.asset(
                "assets/images/tip_illustration.png",
                width: imageWidth,
                fit: BoxFit.contain,
              ),
            ],
          ),
        );
      },
    );
  }
}
