import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../models/disease_model.dart';

class DiseaseLocalDataSource {
  /// Singleton
  static final DiseaseLocalDataSource _instance =
      DiseaseLocalDataSource._internal();

  factory DiseaseLocalDataSource() => _instance;

  DiseaseLocalDataSource._internal();

  Map<String, DiseaseModel>? _cache;

  /// Load disease database
  Future<void> loadDatabase() async {
    if (_cache != null) return;

    try {
      final jsonString =
          await rootBundle.loadString(
        'assets/data/disease_data.json',
      );

      final Map<String, dynamic> jsonData =
          json.decode(jsonString);

      _cache = jsonData.map(
        (key, value) => MapEntry(
          key,
          DiseaseModel.fromJson(value),
        ),
      );

      debugPrint(
        '✅ Loaded ${_cache!.length} diseases.',
      );
    } catch (e) {
      debugPrint(
        '❌ Failed to load disease database: $e',
      );
      rethrow;
    }
  }

  /// Get all diseases
  Future<Map<String, DiseaseModel>>
      getAllDiseases() async {
    await loadDatabase();

    return _cache!;
  }

  /// Get disease by prediction label
  Future<DiseaseModel> getDisease(
    String label,
  ) async {
    await loadDatabase();

    final disease = _cache![label];

    if (disease == null) {
      throw Exception(
        'Disease "$label" not found in local database.',
      );
    }

    return disease;
  }

  /// Check whether a disease exists
  Future<bool> containsDisease(
    String label,
  ) async {
    await loadDatabase();

    return _cache!.containsKey(label);
  }

  /// Clear cache
  void clearCache() {
    _cache = null;
  }
}