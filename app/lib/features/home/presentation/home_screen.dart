import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/router.dart';
import '../widgets/action_card.dart';
import '../widgets/app_header.dart';
import '../widgets/detection_card.dart';
import '../widgets/home_bottom_nav.dart';
import '../widgets/tip_card.dart';
import '../widgets/welcome_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final horizontalPadding = size.width * 0.05;
    final sectionSpacing = size.height * 0.02;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 16,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppHeader(),

              SizedBox(height: sectionSpacing),

              const WelcomeBanner(),

              SizedBox(height: sectionSpacing),

              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ActionCard(
                        title: 'Capture Image',
                        subtitle: 'Take a photo of affected leaf',
                        icon: Icons.camera_alt_outlined,
                        isCamera: true,
                        onTap: () {
                          context.push(AppRoutes.camera);
                        },
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: ActionCard(
                        title: 'Upload Image',
                        subtitle: 'Choose from your gallery',
                        icon: Icons.image_outlined,
                        isCamera: false,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: sectionSpacing * 1.2),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Detections',
                    style: TextStyle(
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: sectionSpacing * 0.6),

              DetectionCard(
                imagePath: 'assets/images/brown_spot.jpg',
                diseaseName: 'Brown Spot',
                cropName: 'Rice',
                date: 'May 20, 2026 • 09:30 AM',
                riskLabel: 'Medium Risk',
                confidence: '92%',
                riskColor: Colors.orange,
              ),

              SizedBox(height: sectionSpacing * 0.8),

              DetectionCard(
                imagePath: 'assets/images/leaf_blast.jpg',
                diseaseName: 'Leaf Blast',
                cropName: 'Rice',
                date: 'May 18, 2026 • 04:15 PM',
                riskLabel: 'High Risk',
                confidence: '89%',
                riskColor: Colors.red,
              ),

              SizedBox(height: sectionSpacing * 0.8),

              DetectionCard(
                imagePath: 'assets/images/healthy_leaf.jpg',
                diseaseName: 'Healthy',
                cropName: 'Rice',
                date: 'May 15, 2026 • 08:45 AM',
                riskLabel: 'Healthy',
                confidence: '98%',
                riskColor: Colors.green,
              ),

              SizedBox(height: sectionSpacing),

              const TipCard(),

              SizedBox(height: size.height * 0.12),
            ],
          ),
        ),
      ),

      bottomNavigationBar: const HomeBottomNav(currentIndex: 0),
    );
  }
}
