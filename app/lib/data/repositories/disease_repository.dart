import '../datasources/disease_local_data_source.dart';
import '../models/disease_model.dart';
import '../models/prediction_model.dart';

class DiseaseRepository {
  final DiseaseLocalDataSource localDataSource;

  const DiseaseRepository(
    this.localDataSource,
  );

  /// Get disease by predicted label
  Future<DiseaseModel> getDisease(
    String label,
  ) async {
    return await localDataSource.getDisease(
      label,
    );
  }

  /// Get disease directly from prediction
  Future<DiseaseModel> getDiseaseFromPrediction(
    PredictionModel prediction,
  ) async {
    return await getDisease(
      prediction.label,
    );
  }

  /// Get all diseases
  Future<Map<String, DiseaseModel>>
      getAllDiseases() async {
    return await localDataSource
        .getAllDiseases();
  }

  /// Check if disease exists
  Future<bool> containsDisease(
    String label,
  ) async {
    return await localDataSource
        .containsDisease(label);
  }
}