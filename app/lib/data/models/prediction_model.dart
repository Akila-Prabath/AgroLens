class PredictionModel {
  /// Predicted disease label
  final String label;

  /// Confidence percentage (0–100)
  final double confidence;

  /// Predicted class index
  final int classIndex;

  const PredictionModel({
    required this.label,
    required this.confidence,
    required this.classIndex,
  });

  /// Display confidence as text
  String get confidenceText =>
      "${confidence.toStringAsFixed(2)}%";

  /// Confidence as decimal (0–1)
  double get confidenceScore =>
      confidence / 100;

  /// Whether prediction is considered reliable
  bool get isReliable =>
      confidence >= 70.0;

  PredictionModel copyWith({
    String? label,
    double? confidence,
    int? classIndex,
  }) {
    return PredictionModel(
      label: label ?? this.label,
      confidence: confidence ?? this.confidence,
      classIndex: classIndex ?? this.classIndex,
    );
  }

  @override
  String toString() {
    return 'PredictionModel('
        'label: $label, '
        'confidence: ${confidence.toStringAsFixed(2)}%, '
        'classIndex: $classIndex'
        ')';
  }
}