class PredictionModel {
  final String label;
  final double confidence;

  PredictionModel({
    required this.label,
    required this.confidence,
  });

  String get confidenceText =>
      "${confidence.toStringAsFixed(2)}%";
}