import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../presentation/preview_screen.dart';
import 'upload_card.dart';

class RecentUploads extends StatelessWidget {
  const RecentUploads({super.key});

  /// Convert asset image to XFile so it can be opened
  /// in the PreviewScreen just like gallery/camera images.
  Future<XFile> _assetToXFile(String assetPath) async {
    final byteData = await rootBundle.load(assetPath);

    final tempDir = await getTemporaryDirectory();

    final file = File(
      '${tempDir.path}/${assetPath.split('/').last}',
    );

    await file.writeAsBytes(
      byteData.buffer.asUint8List(),
      flush: true,
    );

    return XFile(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 215,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 2),
        itemCount: _items.length,
        separatorBuilder: (_, __) =>
            const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final item = _items[index];

          return UploadCard(
            imagePath: item.image,
            diseaseName: item.name,
            cropName: item.crop,
            date: item.date,
            onTap: () async {
              try {
                final XFile image =
                    await _assetToXFile(item.image);

                if (!context.mounted) return;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PreviewScreen(
                      image: image,
                    ),
                  ),
                );
              } catch (e) {
                if (!context.mounted) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Unable to open image.\n$e',
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class _UploadItem {
  final String image;
  final String name;
  final String crop;
  final String date;

  const _UploadItem({
    required this.image,
    required this.name,
    required this.crop,
    required this.date,
  });
}

const List<_UploadItem> _items = [
  _UploadItem(
    image: "assets/images/brown_spot.jpg",
    name: "Brown Spot",
    crop: "Rice",
    date: "May 20, 2026",
  ),
  _UploadItem(
    image: "assets/images/leaf_blast.jpg",
    name: "Leaf Blast",
    crop: "Rice",
    date: "May 18, 2026",
  ),
  _UploadItem(
    image: "assets/images/bacterial_blight.jpg",
    name: "Bacterial Blight",
    crop: "Rice",
    date: "May 16, 2026",
  ),
  _UploadItem(
    image: "assets/images/healthy_leaf.jpg",
    name: "Healthy",
    crop: "Rice",
    date: "May 15, 2026",
  ),
];