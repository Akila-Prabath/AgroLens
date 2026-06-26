import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PreviewBottomBar extends StatefulWidget {
  final String imagePath;

  const PreviewBottomBar({
    super.key,
    required this.imagePath,
  });

  @override
  State<PreviewBottomBar> createState() =>
      _PreviewBottomBarState();
}

class _PreviewBottomBarState
    extends State<PreviewBottomBar> {

  bool _isAnalyzing = false;

  Future<void> _analyzeImage() async {
    setState(() {
      _isAnalyzing = true;
    });

    /// TODO:
    /// Replace this delay with PredictionProvider.predict()
    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (!mounted) return;

    setState(() {
      _isAnalyzing = false;
    });

    /// TODO:
    /// Navigate to Result Screen
    ///
    /// Example:
    ///
    /// context.push(
    ///   AppRoutes.result,
    ///   extra: widget.imagePath,
    /// );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Prediction screen will be connected next.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        /// Retake Button
        Expanded(
          child: OutlinedButton.icon(
            onPressed:
                _isAnalyzing
                    ? null
                    : () {
                        context.pop();
                      },

            icon: const Icon(
              Icons.refresh_rounded,
            ),

            label: const Text(
              "Retake",
            ),

            style:
                OutlinedButton.styleFrom(
              foregroundColor:
                  const Color(0xFF2E7D32),

              side: const BorderSide(
                color: Color(0xFF2E7D32),
              ),

              minimumSize:
                  const Size.fromHeight(
                56,
              ),

              shape:
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(
                  16,
                ),
              ),

              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight:
                    FontWeight.w600,
              ),
            ),
          ),
        ),

        const SizedBox(width: 16),

        /// Analyze Button
        Expanded(
          flex: 2,
          child: ElevatedButton.icon(
            onPressed:
                _isAnalyzing
                    ? null
                    : _analyzeImage,

            style:
                ElevatedButton.styleFrom(
              elevation: 0,

              backgroundColor:
                  const Color(0xFF2E7D32),

              foregroundColor:
                  Colors.white,

              minimumSize:
                  const Size.fromHeight(
                56,
              ),

              shape:
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(
                  16,
                ),
              ),

              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            icon:
                _isAnalyzing
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child:
                            CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color:
                              Colors.white,
                        ),
                      )
                    : const Icon(
                        Icons
                            .auto_awesome_rounded,
                      ),

            label: Text(
              _isAnalyzing
                  ? "Analyzing..."
                  : "Analyze",
            ),
          ),
        ),
      ],
    );
  }
}