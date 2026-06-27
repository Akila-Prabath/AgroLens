import 'package:flutter/material.dart';

class UploadTipCard extends StatelessWidget {
  const UploadTipCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2E7D32),
            Color(0xFF43A047),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.22),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Row(
        children: [
          /// Left Content
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(
                      .18,
                    ),
                    borderRadius:
                        BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: const Text(
                    "📷 Upload Tip",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight:
                          FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                const Text(
                  "Choose a Clear Leaf Image",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight:
                        FontWeight.bold,
                    height: 1.2,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Upload a well-lit leaf photo with the affected area clearly visible for the most accurate AI disease detection.",
                  style: TextStyle(
                    color: Colors.white.withOpacity(
                      .92,
                    ),
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 18),

                InkWell(
                  onTap: () {},

                  child: const Row(
                    mainAxisSize:
                        MainAxisSize.min,
                    children: [
                      Text(
                        "Learn More",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight:
                              FontWeight.w600,
                        ),
                      ),

                      SizedBox(width: 6),

                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 18),

          /// Illustration
          Container(
            width: 105,
            height: 105,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(
                .12,
              ),
              borderRadius:
                  BorderRadius.circular(
                22,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.all(12),
              child: Image.asset(
                "assets/images/upload_tip.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}