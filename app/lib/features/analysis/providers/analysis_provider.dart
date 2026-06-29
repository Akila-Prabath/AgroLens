import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/providers.dart';
import '../../../data/models/disease_model.dart';
import '../../../data/models/prediction_model.dart';

/// =======================================================
/// Analysis State
/// =======================================================

class AnalysisState {
  final double progress;
  final int currentStep;
  final bool isCompleted;
  final bool isLoading;
  final String? error;

  final PredictionModel? prediction;
  final DiseaseModel? disease;

  const AnalysisState({
    this.progress = 0,
    this.currentStep = 0,
    this.isCompleted = false,
    this.isLoading = false,
    this.error,
    this.prediction,
    this.disease,
  });

  AnalysisState copyWith({
    double? progress,
    int? currentStep,
    bool? isCompleted,
    bool? isLoading,
    String? error,
    PredictionModel? prediction,
    DiseaseModel? disease,
  }) {
    return AnalysisState(
      progress: progress ?? this.progress,
      currentStep: currentStep ?? this.currentStep,
      isCompleted: isCompleted ?? this.isCompleted,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      prediction: prediction ?? this.prediction,
      disease: disease ?? this.disease,
    );
  }
}

/// =======================================================
/// Analysis Notifier
/// =======================================================

class AnalysisNotifier extends Notifier<AnalysisState> {
  Timer? _timer;

  @override
  AnalysisState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });

    return const AnalysisState();
  }

  Future<void> startAnalysis(
    File image,
  ) async {
    _timer?.cancel();

    state = const AnalysisState(
      isLoading: true,
    );

    _startProgress();

    try {
      final predictionService =
          ref.read(
        predictionServiceProvider,
      );

      final repository =
          ref.read(
        diseaseRepositoryProvider,
      );

      /// Run AI prediction
      final prediction =
          await predictionService.predictImage(
        image,
      );

      /// Load disease information
      final disease =
          await repository.getDiseaseFromPrediction(
        prediction,
      );

      _timer?.cancel();

      state = state.copyWith(
        progress: 1.0,
        currentStep: 5,
        isCompleted: true,
        isLoading: false,
        prediction: prediction,
        disease: disease,
      );
    } catch (e) {
      _timer?.cancel();

      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void _startProgress() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 120),
      (timer) {
        if (state.progress >= 0.95) {
          return;
        }

        final progress =
            state.progress + 0.02;

        int step = 0;

        if (progress >= 0.20) step = 1;
        if (progress >= 0.40) step = 2;
        if (progress >= 0.60) step = 3;
        if (progress >= 0.80) step = 4;

        state = state.copyWith(
          progress: progress,
          currentStep: step,
        );
      },
    );
  }

  void reset() {
    _timer?.cancel();

    state = const AnalysisState();
  }
}

/// =======================================================
/// Provider
/// =======================================================

final analysisProvider =
    NotifierProvider<
        AnalysisNotifier,
        AnalysisState>(
  AnalysisNotifier.new,
);