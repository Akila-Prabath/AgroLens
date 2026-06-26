import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CameraHeader extends StatelessWidget {
  const CameraHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(
        20,
        18,
        20,
        18,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Back Button
          _CircleButton(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () => context.pop(),
          ),

          const SizedBox(width: 18),

          /// Logo + Title
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/agrolens_logo.png',
                      width: 42,
                      height: 42,
                    ),

                    const SizedBox(width: 10),

                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Agro',
                            style: TextStyle(
                              color: Color(0xFF2E7D32),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Lens',
                            style: TextStyle(
                              color: Color(0xFF1F2937),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                const Text(
                  'Capture Leaf Image',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 18),

          /// Help Button
          const _CircleButton(
            icon: Icons.help_outline_rounded,
          ),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _CircleButton({
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      elevation: 3,
      shadowColor: Colors.black12,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(
            icon,
            size: 28,
            color: const Color(0xFF1F2937),
          ),
        ),
      ),
    );
  }
}