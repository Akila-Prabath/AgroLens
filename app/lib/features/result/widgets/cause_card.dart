import 'package:flutter/material.dart';

class CauseCard extends StatelessWidget {
  final String title;
  final List<String> causes;
  final VoidCallback? onViewMore;

  const CauseCard({
    super.key,
    this.title = "Causes",
    required this.causes,
    this.onViewMore,
  });

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Icon
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF8EC),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.lightbulb_outline_rounded,
              color: Color(0xFF168A2F),
              size: 22,
            ),
          ),

          const SizedBox(width: 14),

          /// Content
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),

                    const Spacer(),

                    if (onViewMore != null)
                      InkWell(
                        borderRadius:
                            BorderRadius.circular(12),
                        onTap: onViewMore,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 2,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "View More",
                                style: TextStyle(
                                  color:
                                      Color(0xFF168A2F),
                                  fontSize: 13,
                                  fontWeight:
                                      FontWeight.w600,
                                ),
                              ),

                              SizedBox(width: 4),

                              Icon(
                                Icons
                                    .chevron_right_rounded,
                                color:
                                    Color(0xFF168A2F),
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 16),

                if (causes.isEmpty)
                  const Text(
                    "No causes available.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  )
                else
                  ...causes.map(
                    (cause) => Padding(
                      padding:
                          const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.only(
                              top: 5,
                            ),
                            child: Icon(
                              Icons.circle,
                              size: 8,
                              color:
                                  Color(0xFF168A2F),
                            ),
                          ),

                          const SizedBox(width: 10),

                          Expanded(
                            child: Text(
                              cause,
                              style: const TextStyle(
                                fontSize: 14,
                                height: 1.6,
                                color:
                                    Color(0xFF4B5563),
                              ),
                            ),
                          ),
                        ],
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