import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/disease_local_data_source.dart';
import '../../data/repositories/disease_repository.dart';
import '../services/image_service.dart';
import '../services/label_service.dart';
import '../services/prediction_service.dart';
import '../services/tflite_service.dart';

/// ===============================
/// Services
/// ===============================

final imageServiceProvider =
    Provider<ImageService>(
  (ref) => ImageService(),
);

final tfliteServiceProvider =
    Provider<TFLiteService>(
  (ref) => TFLiteService(),
);

final labelServiceProvider =
    Provider<LabelService>(
  (ref) => LabelService(),
);

/// ===============================
/// Prediction Service
/// ===============================

final predictionServiceProvider =
    Provider<PredictionService>(
  (ref) {
    return PredictionService(
      tfliteService: ref.read(
        tfliteServiceProvider,
      ),
      imageService: ref.read(
        imageServiceProvider,
      ),
      labelService: ref.read(
        labelServiceProvider,
      ),
    );
  },
);

/// ===============================
/// Data Source
/// ===============================

final diseaseLocalDataSourceProvider =
    Provider<DiseaseLocalDataSource>(
  (ref) => DiseaseLocalDataSource(),
);

/// ===============================
/// Repository
/// ===============================

final diseaseRepositoryProvider =
    Provider<DiseaseRepository>(
  (ref) {
    return DiseaseRepository(
      ref.read(
        diseaseLocalDataSourceProvider,
      ),
    );
  },
);