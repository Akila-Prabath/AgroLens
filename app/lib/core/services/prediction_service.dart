import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

import '../../data/models/prediction_model.dart';
import 'label_service.dart';
import 'tflite_service.dart';

class PredictionService {
  final TFLiteService tfliteService;
  final LabelService labelService;

  PredictionService({
    required this.tfliteService,
    required this.labelService,
  });

  Future<PredictionModel> predictImage(
    File imageFile,
  ) async {
    final interpreter =
        tfliteService.interpreter;

    if (interpreter == null) {
      throw Exception(
        'Model not loaded',
      );
    }

    final labels =
        await labelService.loadLabels();

    final input = await _preprocessImage(
      imageFile,
    );

    final output = List.generate(
      1,
      (_) => List.filled(
        labels.length,
        0.0,
      ),
    );

    interpreter.run(
      input,
      output,
    );

    final predictions =
        output.first;

    int maxIndex = 0;

    double maxConfidence =
        predictions[0];

    for (
      int i = 1;
      i < predictions.length;
      i++
    ) {
      if (predictions[i] >
          maxConfidence) {
        maxConfidence =
            predictions[i];

        maxIndex = i;
      }
    }

    return PredictionModel(
      label: labels[maxIndex],
      confidence:
          maxConfidence * 100,
    );
  }

  Future<List<List<List<List<double>>>>>
      _preprocessImage(
    File imageFile,
  ) async {
    final Uint8List bytes =
        await imageFile.readAsBytes();

    final img.Image?
        originalImage =
        img.decodeImage(bytes);

    if (originalImage == null) {
      throw Exception(
        'Unable to decode image',
      );
    }

    final resized =
        img.copyResize(
      originalImage,
      width: 224,
      height: 224,
    );

    return [
      List.generate(
        224,
        (y) => List.generate(
          224,
          (x) {
            final pixel =
                resized.getPixel(
              x,
              y,
            );

            return [
              pixel.r / 255.0,
              pixel.g / 255.0,
              pixel.b / 255.0,
            ];
          },
        ),
      )
    ];
  }
}