import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/disease_model.dart';

class DiseaseLocalDataSource {
  Future<Map<String, DiseaseModel>>
      loadDiseases() async {
    final jsonString =
        await rootBundle.loadString(
      'assets/data/disease_data.json',
    );

    final Map<String, dynamic> jsonData =
        json.decode(jsonString);

    return jsonData.map(
      (key, value) => MapEntry(
        key,
        DiseaseModel.fromJson(value),
      ),
    );
  }
}