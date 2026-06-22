import 'package:flutter/services.dart';

class LabelService {
  Future<List<String>> loadLabels() async {
    final data =
        await rootBundle.loadString(
      'assets/models/labels.txt',
    );

    return data
        .split('\n')
        .where(
          (label) =>
              label.trim().isNotEmpty,
        )
        .toList();
  }
}