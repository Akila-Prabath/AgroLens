import 'package:flutter/material.dart';

class AnalysisStatus extends StatelessWidget {
  /// Current AI step (0-4)
  final int currentStep;

  const AnalysisStatus({
    super.key,
    this.currentStep = 0,
  });

  static const List<String> _steps = [
    "Processing Image",
    "Detecting Crop",
    "Identifying Disease",
    "Preparing Recommendation",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: List.generate(
          _steps.length,
          (index) => Padding(
            padding: EdgeInsets.only(
              bottom: index == _steps.length - 1 ? 0 : 18,
            ),
            child: _StatusTile(
              title: _steps[index],
              status: index < currentStep
                  ? AnalysisStep.completed
                  : index == currentStep
                      ? AnalysisStep.processing
                      : AnalysisStep.pending,
            ),
          ),
        ),
      ),
    );
  }
}

enum AnalysisStep {
  completed,
  processing,
  pending,
}

class _StatusTile extends StatelessWidget {
  final String title;
  final AnalysisStep status;

  const _StatusTile({
    required this.title,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Widget leading;

    switch (status) {
      case AnalysisStep.completed:
        leading = Container(
          width: 16,
          height: 16,
          decoration: const BoxDecoration(
            color: Color(0xFF2E7D32),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 14,
          ),
        );
        break;

      case AnalysisStep.processing:
        leading = const SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: Color(0xFF2E7D32),
          ),
        );
        break;

      case AnalysisStep.pending:
        leading = Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFD1D5DB),
              width: 2,
            ),
          ),
        );
        break;
    }

    return Row(
      children: [
        leading,

        const SizedBox(width: 16),

        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: status == AnalysisStep.processing
                  ? FontWeight.w700
                  : FontWeight.w500,
              color: status == AnalysisStep.pending
                  ? const Color(0xFF9CA3AF)
                  : const Color(0xFF1F2937),
            ),
          ),
        ),

        if (status == AnalysisStep.completed)
          const Icon(
            Icons.done_all_rounded,
            color: Color(0xFF2E7D32),
            size: 14,
          ),

        if (status == AnalysisStep.processing)
          const Text(
            "Running",
            style: TextStyle(
              color: Color(0xFF2E7D32),
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
      ],
    );
  }
}