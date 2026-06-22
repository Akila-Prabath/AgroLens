import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        context.go(AppRoutes.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset('assets/images/splash_background.png', fit: BoxFit.cover),

          SafeArea(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: SizedBox(
                height: screenHeight,
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.08),

                    // Logo
                    Image.asset(
                      'assets/images/agrolens_logo.png',
                      width: 180,
                      height: 180,
                    ),

                    const SizedBox(height: 0),

                    // App Name
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Agro',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF2E7D32),
                              letterSpacing: -1,
                            ),
                          ),
                          TextSpan(
                            text: 'Lens',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF111827),
                              letterSpacing: -1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Subtitle
                    const Text(
                      'AI Crop Disease Detection',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Divider
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: 60, height: 1, color: Colors.green),

                        const SizedBox(width: 10),

                        const Icon(Icons.eco, color: Colors.green, size: 22),

                        const SizedBox(width: 10),

                        Container(width: 60, height: 1, color: Colors.green),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Detect. Diagnose. Protect.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      'Empowering farmers with AI.',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),

                    const Spacer(),

                    SizedBox(height: screenHeight * 0.08),

                    // Loading Section
                    const Text(
                      'Loading...',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2E7D32),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const LinearProgressIndicator(
                          value: 0.7,
                          minHeight: 8,
                          backgroundColor: Color(0xFFE5E7EB),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.06),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
