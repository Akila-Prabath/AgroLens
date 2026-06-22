import '../datasources/disease_local_data_source.dart';
import '../models/disease_model.dart';

class DiseaseRepository {
  final DiseaseLocalDataSource
      localDataSource;

  DiseaseRepository(
    this.localDataSource,
  );

  Future<DiseaseModel?> getDisease(
    String diseaseKey,
  ) async {
    final diseases =
        await localDataSource.loadDiseases();

    return diseases[diseaseKey];
  }

  Future<Map<String, DiseaseModel>>
      getAllDiseases() async {
    return await localDataSource
        .loadDiseases();
  }
}