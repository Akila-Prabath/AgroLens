import 'package:flutter/material.dart';

class UploadArea extends StatelessWidget {
  final VoidCallback? onGallery;
  final VoidCallback? onCamera;

  const UploadArea({
    super.key,
    this.onGallery,
    this.onCamera,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final imageSize = width * 0.32;
    final titleSize = width * 0.05;
    final bodySize = width * 0.03;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: const Color(0xFFCDE7CF),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(.05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          /// Illustration
          Image.asset(
            "assets/images/upload_illustration.png",
            width: imageSize,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 24),

          /// Title
          Text(
            "Upload Leaf Image",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: titleSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F2937),
            ),
          ),

          const SizedBox(height: 14),

          Text(
            "Choose an image from your gallery\n"
            "to analyze crop disease.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: bodySize,
              height: 1.5,
              color: const Color(0xFF6B7280),
            ),
          ),

          const SizedBox(height: 22),

          /// Gallery Button
          SizedBox(
            width: double.infinity,
            height: 38,
            child: ElevatedButton.icon(
              onPressed: onGallery,
              icon: const Icon(Icons.image_outlined),
              label: const Text(
                "Choose from Gallery",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color(0xFF168A2F),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),

          const SizedBox(height: 22),

          /// Divider
          Row(
            children: [
              const Expanded(
                child: Divider(
                  color: Color(0xFFE5E7EB),
                  thickness: 1,
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  "OR",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const Expanded(
                child: Divider(
                  color: Color(0xFFE5E7EB),
                  thickness: 1,
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          /// Camera Button
          SizedBox(
            width: double.infinity,
            height: 38,
            child: OutlinedButton.icon(
              onPressed: onCamera,
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Color(0xFF168A2F),
              ),
              label: const Text(
                "Take a Photo",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF168A2F),
                ),
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(
                  color: Color(0xFFE5E7EB),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}