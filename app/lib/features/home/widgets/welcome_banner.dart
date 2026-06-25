import 'package:flutter/material.dart';

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: const Color(
          0xFFF3FAF3,
        ),
        borderRadius:
            BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.04,
            ),
            blurRadius: 20,
            offset: const Offset(
              0,
              8,
            ),
          ),
        ],
      ),

      child: Stack(
        children: [

          // Plant Image
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.only(
                topRight:
                    Radius.circular(24),
                bottomRight:
                    Radius.circular(24),
              ),
              child: Image.asset(
                'assets/images/welcome_plant.png',
                width: 140,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Text Content
          Padding(
            padding:
                const EdgeInsets.all(
              24,
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,
              mainAxisAlignment:
                  MainAxisAlignment
                      .center,
              children: [

                const Row(
                  children: [

                    Text(
                      'Hello, Farmer!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight
                                .w700,
                        color: Color(
                          0xFF111827,
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 8,
                    ),

                    Text(
                      '👋',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 12,
                ),

                SizedBox(
                  width: 180,
                  child: Text(
                    'Detect crop diseases early and protect your yield.',
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.5,
                      color: Colors.grey
                          .shade700,
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