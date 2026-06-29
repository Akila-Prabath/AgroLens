import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/disease_model.dart';
import '../../../data/models/prediction_model.dart';

/// =======================================================
/// Result State
/// =======================================================

class ResultState {
  final String? imagePath;

  final PredictionModel? prediction;

  final DiseaseModel? disease;

  final bool isLoading;

  final String? error;

  const ResultState({
    this.imagePath,
    this.prediction,
    this.disease,
    this.isLoading = false,
    this.error,
  });

  ResultState copyWith({
    String? imagePath,
    PredictionModel? prediction,
    DiseaseModel? disease,
    bool? isLoading,
    String? error,
  }) {
    return ResultState(
      imagePath: imagePath ?? this.imagePath,
      prediction: prediction ?? this.prediction,
      disease: disease ?? this.disease,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  /// -------------------------------------------------------
  /// Convenience Getters
  /// -------------------------------------------------------

  String get diseaseName =>
      disease?.name ?? '';

  String get scientificName =>
      disease?.scientificName ?? '';

  double get confidence =>
      prediction?.confidence ?? 0;

  String get confidenceText =>
      prediction?.confidenceText ?? '0%';

  String get cropName =>
      disease?.cropName ?? '';

  String get growthStage =>
      disease?.growthStage ?? '';

  String get severity =>
      disease?.severity ?? '';

  String get description =>
      disease?.description ?? '';

  List<String> get symptoms =>
      disease?.symptoms ?? const [];

  List<String> get causes =>
      disease?.causes ?? const [];

  List<String> get fertilizers =>
      disease?.fertilizers ?? const [];

  List<String> get chemicals =>
      disease?.chemicals ?? const [];

  List<String> get prevention =>
      disease?.prevention ?? const [];
}

/// =======================================================
/// Result Notifier
/// =======================================================

class ResultNotifier extends Notifier<ResultState> {
  @override
  ResultState build() {
    return const ResultState();
  }

  /// Set prediction result from AI
  void setResult({
    required String imagePath,
    required PredictionModel prediction,
    required DiseaseModel disease,
  }) {
    state = ResultState(
      imagePath: imagePath,
      prediction: prediction,
      disease: disease,
    );
  }

  /// Loading state
  void setLoading(bool loading) {
    state = state.copyWith(
      isLoading: loading,
    );
  }

  /// Error state
  void setError(String message) {
    state = state.copyWith(
      error: message,
      isLoading: false,
    );
  }

  /// Clear
  void clear() {
    state = const ResultState();
  }
}

/// =======================================================
/// Provider
/// =======================================================

final resultProvider =
    NotifierProvider<ResultNotifier, ResultState>(
  ResultNotifier.new,
);