import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/providers.dart';
import '../../../data/models/prediction_model.dart';

class PredictionState {
  final bool isLoading;
  final File? image;
  final PredictionModel? prediction;
  final String? error;

  const PredictionState({
    this.isLoading = false,
    this.image,
    this.prediction,
    this.error,
  });

  PredictionState copyWith({
    bool? isLoading,
    File? image,
    PredictionModel? prediction,
    String? error,
  }) {
    return PredictionState(
      isLoading: isLoading ?? this.isLoading,
      image: image ?? this.image,
      prediction: prediction ?? this.prediction,
      error: error,
    );
  }
}

class PredictionNotifier
    extends Notifier<PredictionState> {

  @override
  PredictionState build() {
    return const PredictionState();
  }

  Future<void> predict(
    File imageFile,
  ) async {
    try {

      state = state.copyWith(
        isLoading: true,
        image: imageFile,
        error: null,
      );

      final prediction =
          await ref
              .read(
                predictionServiceProvider,
              )
              .predictImage(
                imageFile,
              );

      state = state.copyWith(
        isLoading: false,
        prediction: prediction,
      );

    } catch (e) {

      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void clear() {
    state = const PredictionState();
  }
}

final predictionProvider =
    NotifierProvider<
        PredictionNotifier,
        PredictionState>(
  PredictionNotifier.new,
);