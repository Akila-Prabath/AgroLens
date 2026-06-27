import 'package:flutter/material.dart';

class CameraOverlay extends StatelessWidget {
  const CameraOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return Stack(
          children: [
            /// Instruction Banner
            Positioned(
              top: 26,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.40),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.eco_outlined,
                        color: Colors.white,
                        size: 22,
                      ),

                      SizedBox(width: 8),

                      Text(
                        "Place the affected leaf\nwithin the frame",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Scanner Frame
            Positioned(
              left: width * 0.08,
              right: width * 0.18,
              top: height * 0.16,
              bottom: height * 0.14,
              child: const _ScannerFrame(),
            ),
          ],
        );
      },
    );
  }
}

class _ScannerFrame extends StatelessWidget {
  const _ScannerFrame();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: _Corner(
            top: true,
            left: true,
          ),
        ),

        Align(
          alignment: Alignment.topRight,
          child: _Corner(
            top: true,
            left: false,
          ),
        ),

        Align(
          alignment: Alignment.bottomLeft,
          child: _Corner(
            top: false,
            left: true,
          ),
        ),

        Align(
          alignment: Alignment.bottomRight,
          child: _Corner(
            top: false,
            left: false,
          ),
        ),
      ],
    );
  }
}

class _Corner extends StatelessWidget {
  final bool top;
  final bool left;

  const _Corner({
    required this.top,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    const double size = 60;
    const double thickness = 5;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border(
          top: top
              ? const BorderSide(
                  color: Colors.white,
                  width: thickness,
                )
              : BorderSide.none,
          bottom: !top
              ? const BorderSide(
                  color: Colors.white,
                  width: thickness,
                )
              : BorderSide.none,
          left: left
              ? const BorderSide(
                  color: Colors.white,
                  width: thickness,
                )
              : BorderSide.none,
          right: !left
              ? const BorderSide(
                  color: Colors.white,
                  width: thickness,
                )
              : BorderSide.none,
        ),
        borderRadius: BorderRadius.only(
          topLeft:
              top && left ? const Radius.circular(18) : Radius.zero,
          topRight:
              top && !left ? const Radius.circular(18) : Radius.zero,
          bottomLeft:
              !top && left ? const Radius.circular(18) : Radius.zero,
          bottomRight:
              !top && !left ? const Radius.circular(18) : Radius.zero,
        ),
      ),
    );
  }
}