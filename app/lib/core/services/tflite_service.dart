import 'dart:typed_data';

import 'package:tflite_flutter/tflite_flutter.dart';

class TFLiteService {
  Interpreter? _interpreter;

  Future<void> loadModel() async {
    _interpreter =
        await Interpreter.fromAsset(
      'assets/models/agrolens_model.tflite',
    );
  }

  Interpreter? get interpreter =>
      _interpreter;

  void close() {
    _interpreter?.close();
  }
}