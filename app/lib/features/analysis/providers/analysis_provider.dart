import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// =======================================================
/// Analysis State
/// =======================================================

class AnalysisState {
  final double progress;
  final int currentStep;
  final bool isCompleted;

  const AnalysisState({
    this.progress = 0.0,
    this.currentStep = 0,
    this.isCompleted = false,
  });

  AnalysisState copyWith({
    double? progress,
    int? currentStep,
    bool? isCompleted,
  }) {
    return AnalysisState(
      progress: progress ?? this.progress,
      currentStep: currentStep ?? this.currentStep,
      isCompleted: isCompleted ?? this.isCompleted,
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

  /// Start AI Analysis Animation
  void startAnalysis() {
    _timer?.cancel();

    state = const AnalysisState();

    _timer = Timer.periodic(
      const Duration(milliseconds: 80),
      (timer) {
        final nextProgress = state.progress + 0.02;

        if (nextProgress >= 1.0) {
          timer.cancel();

          state = state.copyWith(
            progress: 1.0,
            currentStep: 5,
            isCompleted: true,
          );

          return;
        }

        int step = 0;

        if (nextProgress >= 0.20) {
          step = 1;
        }

        if (nextProgress >= 0.40) {
          step = 2;
        }

        if (nextProgress >= 0.60) {
          step = 3;
        }

        if (nextProgress >= 0.80) {
          step = 4;
        }

        state = state.copyWith(
          progress: nextProgress,
          currentStep: step,
        );
      },
    );
  }

  /// Reset Analysis
  void reset() {
    _timer?.cancel();

    state = const AnalysisState();
  }
}

/// =======================================================
/// Provider
/// =======================================================

final analysisProvider =
    NotifierProvider<AnalysisNotifier, AnalysisState>(
  AnalysisNotifier.new,
);