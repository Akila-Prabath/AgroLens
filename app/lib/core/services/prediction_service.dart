import 'dart:io';

import '../../data/models/prediction_model.dart';
import 'image_service.dart';
import 'label_service.dart';
import 'tflite_service.dart';

class PredictionService {
  final TFLiteService tfliteService;
  final ImageService imageService;
  final LabelService labelService;

  PredictionService({
    required this.tfliteService,
    required this.imageService,
    required this.labelService,
  });

  Future<PredictionModel> predictImage(File imageFile) async {
    /// Ensure model is loaded
    if (!tfliteService.isLoaded) {
      await tfliteService.loadModel();
    }

    /// Ensure labels are loaded
    await labelService.loadLabels();

    /// Convert image to model input tensor
    final inputTensor = imageService.prepareInputTensor(imageFile);

    /// Model input shape:
    /// [1, 224, 224, 3]
    final input = [inputTensor];

    /// Output tensor
    final output = List.generate(
      1,
      (_) => List.filled(labelService.labels.length, 0.0),
    );

    /// Run inference
    tfliteService.run(input, output);

    final predictions = output.first;
    print("Raw output:");
for (int i = 0; i < predictions.length; i++) {
  print("${labelService.labels[i]} : ${predictions[i]}");
}

    final label = labelService.getPredictedLabel(predictions);

    print("Predicted label : $label");

    final confidence = labelService.getConfidence(predictions);

    final classIndex = labelService.getBestIndex(predictions);

    return PredictionModel(
      label: label,
      confidence: confidence * 100,
      classIndex: classIndex,
    );
  }
}
