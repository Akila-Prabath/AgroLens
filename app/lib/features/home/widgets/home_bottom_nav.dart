import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';

class HomeBottomNav extends StatelessWidget {
  final int currentIndex;

  const HomeBottomNav({
    super.key,
    this.currentIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SizedBox(
        height: 90,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [

            // Bottom Navigation Bar
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 72,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey.shade200,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 12,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  children: [

                    Expanded(
                      child: _NavItem(
                        icon: Icons.home_rounded,
                        label: 'Home',
                        isSelected: currentIndex == 0,
                        onTap: () => context.go(
                          AppRoutes.home,
                        ),
                      ),
                    ),

                    Expanded(
                      child: _NavItem(
                        icon: Icons.history_rounded,
                        label: 'History',
                        isSelected: currentIndex == 1,
                        onTap: () => context.go(
                          AppRoutes.history,
                        ),
                      ),
                    ),

                    // Empty space for camera
                    const SizedBox(width: 80),

                    Expanded(
                      child: _NavItem(
                        icon: Icons.menu_book_outlined,
                        label: 'Diseases',
                        isSelected: currentIndex == 2,
                        onTap: () {
                          // TODO
                        },
                      ),
                    ),

                    Expanded(
                      child: _NavItem(
                        icon: Icons.person_outline_rounded,
                        label: 'Profile',
                        isSelected: currentIndex == 3,
                        onTap: () => context.go(
                          AppRoutes.profile,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Floating Camera Button
            Positioned(
              top: 0,
              child: GestureDetector(
                onTap: () {
                  // TODO:
                  // Open Camera Screen
                },
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF2E7D32),
                        Color(0xFF43A047),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.05),
                        blurRadius: 18,
                        offset: const Offset(
                          0,
                          8,
                        ),
                      ),
                    ],
                    border: Border.all(
                      color: Colors.white,
                      width: 8,
                    ),
                  ),
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = isSelected
        ? const Color(0xFF2E7D32)
        : const Color(0xFF6B7280);

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 72,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              icon,
              size: 24,
              color: color,
            ),

            const SizedBox(height: 3),

            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected
                    ? FontWeight.w600
                    : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}