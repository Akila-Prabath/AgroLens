import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../camera/presentation/camera_screen.dart';
import '../../camera/widgets/camera_header.dart';
import '../../home/widgets/home_bottom_nav.dart';
import '../presentation/preview_screen.dart';
import '../providers/upload_provider.dart';
import '../widgets/recent_uploads.dart';
import '../widgets/upload_area.dart';
import '../widgets/upload_tip_card.dart';

class UploadScreen extends ConsumerWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            16,
            12,
            16,
            16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              const CameraHeader(
                title: "Upload Leaf Image",
                showBack: true,
              ),

              const SizedBox(height: 20),

              /// Upload Area
              UploadArea(
                onGallery: () async {
                  final image = await ref
                      .read(uploadProvider.notifier)
                      .pickFromGallery();

                  if (image == null) return;

                  if (!context.mounted) return;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PreviewScreen(
                        image: image,
                      ),
                    ),
                  );
                },
                onCamera: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CameraScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),

              /// Recent Images
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recent Images",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      // TODO:
                      // Navigate to Upload History
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(50, 30),
                      tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      "View All",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF2E7D32),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              /// Recent Uploads
              const RecentUploads(),

              const SizedBox(height: 20),

              /// Tip Card
              const UploadTipCard(),
            ],
          ),
        ),
      ),

      bottomNavigationBar: const HomeBottomNav(
        currentIndex: 2,
      ),
    );
  }
}