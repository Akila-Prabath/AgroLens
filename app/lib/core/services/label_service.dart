import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class LabelService {
  /// Singleton
  static final LabelService _instance =
      LabelService._internal();

  factory LabelService() => _instance;

  LabelService._internal();

  List<String> _labels = [];

  /// Load labels.txt
  Future<void> loadLabels() async {
    if (_labels.isNotEmpty) return;

    try {
      final data = await rootBundle.loadString(
        'assets/models/labels.txt',
      );

      _labels = data
          .split('\n')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();

      debugPrint(
        '✅ Loaded ${_labels.length} labels.',
      );
    } catch (e) {
      debugPrint(
        '❌ Failed to load labels: $e',
      );
      rethrow;
    }
  }

  /// Get all labels
  List<String> get labels => _labels;

  /// Get label by index
  String getLabel(int index) {
    if (_labels.isEmpty) {
      throw Exception(
        'Labels have not been loaded.',
      );
    }

    if (index < 0 || index >= _labels.length) {
      return 'Unknown';
    }

    return _labels[index];
  }

  /// Get highest confidence index
  int getBestIndex(List<double> output) {
    double max = output.first;
    int index = 0;

    for (int i = 1; i < output.length; i++) {
      if (output[i] > max) {
        max = output[i];
        index = i;
      }
    }

    return index;
  }

  /// Get predicted label
  String getPredictedLabel(
    List<double> output,
  ) {
    final index = getBestIndex(output);

    return getLabel(index);
  }

  /// Get confidence score
  double getConfidence(
    List<double> output,
  ) {
    return output[getBestIndex(output)];
  }
}