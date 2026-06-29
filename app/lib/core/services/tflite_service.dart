import 'package:flutter/foundation.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class TFLiteService {
  Interpreter? _interpreter;

  /// Singleton
  static final TFLiteService _instance =
      TFLiteService._internal();

  factory TFLiteService() => _instance;

  TFLiteService._internal();

  /// Load TensorFlow Lite model
  Future<void> loadModel() async {
    if (_interpreter != null) return;

    try {
      final options = InterpreterOptions()
        ..threads = 4;

      _interpreter = await Interpreter.fromAsset(
        'assets/models/agrolens_model.tflite',
        options: options,
      );

      debugPrint(
        '✅ TFLite model loaded successfully',
      );

      debugPrint(
        'Input Tensor: ${_interpreter!.getInputTensor(0).shape}',
      );

      debugPrint(
        'Output Tensor: ${_interpreter!.getOutputTensor(0).shape}',
      );

      print(interpreter.getInputTensor(0).type);
print(interpreter.getOutputTensor(0).type);
    } catch (e) {
      debugPrint(
        '❌ Failed to load model: $e',
      );

      rethrow;
    }
  }

  /// Interpreter
  Interpreter get interpreter {
    if (_interpreter == null) {
      throw Exception(
        'TFLite model is not loaded.',
      );
    }

    return _interpreter!;
  }

  /// Run inference
  void run(
    Object input,
    Object output,
  ) {
    interpreter.run(
      input,
      output,
    );
  }

  /// Check whether model is loaded
  bool get isLoaded =>
      _interpreter != null;

  /// Dispose interpreter
  void close() {
    _interpreter?.close();
    _interpreter = null;

    debugPrint(
      '🗑️ TFLite interpreter closed.',
    );
  }
}