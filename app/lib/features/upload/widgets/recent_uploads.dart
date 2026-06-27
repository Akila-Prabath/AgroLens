import 'package:flutter/material.dart';

import 'upload_card.dart';

class RecentUploads extends StatelessWidget {
  const RecentUploads({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 215,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 2),
        itemCount: _items.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final item = _items[index];

          return UploadCard(
            imagePath: item.image,
            diseaseName: item.name,
            cropName: item.crop,
            date: item.date,
            onTap: () {
              // TODO:
              // Open Preview Screen
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