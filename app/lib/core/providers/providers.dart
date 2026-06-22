import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/disease_local_data_source.dart';
import '../../data/repositories/disease_repository.dart';
import '../services/label_service.dart';
import '../services/prediction_service.dart';
import '../services/tflite_service.dart';
import '../services/image_service.dart';

final diseaseRepositoryProvider =
    Provider<DiseaseRepository>((ref) {
  return DiseaseRepository(
    DiseaseLocalDataSource(),
  );
});

final tfliteServiceProvider =
    Provider<TFLiteService>(
  (ref) => TFLiteService(),
);

final labelServiceProvider =
    Provider<LabelService>(
  (ref) => LabelService(),
);

final predictionServiceProvider =
    Provider<PredictionService>(
  (ref) {
    return PredictionService(
      tfliteService:
          ref.read(
        tfliteServiceProvider,
      ),
      labelService:
          ref.read(
        labelServiceProvider,
      ),
    );
  },
);

final imageServiceProvider =
    Provider<ImageService>(
  (ref) => ImageService(),
);