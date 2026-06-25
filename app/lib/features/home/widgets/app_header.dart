import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        // Menu Button
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            size: 30,
            color: Color(
              0xFF1F2937,
            ),
          ),
        ),

        const Spacer(),

        // Logo + Title
        Column(
          children: [
            Row(
              mainAxisSize:
                  MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/agrolens_logo.png',
                  width: 50,
                  height: 50,
                ),

                const SizedBox(
                  width: 8,
                ),

                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Agro',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight:
                              FontWeight
                                  .bold,
                          color: Color(
                            0xFF2E7D32,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: 'Lens',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight:
                              FontWeight
                                  .bold,
                          color: Color(
                            0xFF111827,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 4,
            ),

            /*const Text(
              'AI Crop Disease Detection',
              style: TextStyle(
                fontSize: 12,
                fontWeight:
                    FontWeight.w400,
                color:
                    Color(0xFF6B7280),
              ),
            ),*/
          ],
        ),

        const Spacer(),

        // Notification Button
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                size: 30,
                color: Color(
                  0xFF1F2937,
                ),
              ),
            ),

            Positioned(
              right: 10,
              top: 10,
              child: Container(
                width: 10,
                height: 10,
                decoration:
                    const BoxDecoration(
                  color:
                      Color(0xFF22C55E),
                  shape:
                      BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}