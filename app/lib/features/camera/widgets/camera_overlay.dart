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

        final frameWidth = width * 0.70;
        final frameHeight = height * 0.62;

        return Stack(
          children: [
            /// ==========================
            /// Instruction Banner
            /// ==========================
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.38),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.eco_outlined,
                        color: Colors.white,
                        size: 28,
                      ),

                      SizedBox(width: 12),

                      Text(
                        'Place the affected leaf\nwithin the frame',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// ==========================
            /// Scan Frame
            /// ==========================
            Center(
              child: SizedBox(
                width: frameWidth,
                height: frameHeight,
                child: const _ScannerFrame(),
              ),
            ),

            /// ==========================
            /// Zoom Control
            /// ==========================
            Positioned(
              right: 22,
              top: height * 0.33,
              child: Container(
                width: 70,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.55),
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(
                    color: Colors.white24,
                  ),
                ),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 34,
                    ),

                    Text(
                      '1.0x',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 34,
                    ),
                  ],
                ),
              ),
            ),

            /// ==========================
            /// Flash Button
            /// ==========================
            Positioned(
              right: 20,
              bottom: 80,
              child: Column(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.55),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white24,
                      ),
                    ),
                    child: const Icon(
                      Icons.flashlight_on_outlined,
                      color: Colors.white,
                      size: 34,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Flash',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
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
    const double corner = 70;
    const double thickness = 7;
    const Radius radius = Radius.circular(22);

    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: _Corner(
            width: corner,
            height: corner,
            top: true,
            left: true,
          ),
        ),

        Align(
          alignment: Alignment.topRight,
          child: _Corner(
            width: corner,
            height: corner,
            top: true,
            left: false,
          ),
        ),

        Align(
          alignment: Alignment.bottomLeft,
          child: _Corner(
            width: corner,
            height: corner,
            top: false,
            left: true,
          ),
        ),

        Align(
          alignment: Alignment.bottomRight,
          child: _Corner(
            width: corner,
            height: corner,
            top: false,
            left: false,
          ),
        ),
      ],
    );
  }
}

class _Corner extends StatelessWidget {
  final double width;
  final double height;
  final bool top;
  final bool left;

  const _Corner({
    required this.width,
    required this.height,
    required this.top,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border(
          top: top
              ? const BorderSide(
                  color: Colors.white,
                  width: 7,
                )
              : BorderSide.none,
          bottom: !top
              ? const BorderSide(
                  color: Colors.white,
                  width: 7,
                )
              : BorderSide.none,
          left: left
              ? const BorderSide(
                  color: Colors.white,
                  width: 7,
                )
              : BorderSide.none,
          right: !left
              ? const BorderSide(
                  color: Colors.white,
                  width: 7,
                )
              : BorderSide.none,
        ),
        borderRadius: BorderRadius.only(
          topLeft: top && left
              ? const Radius.circular(22)
              : Radius.zero,
          topRight: top && !left
              ? const Radius.circular(22)
              : Radius.zero,
          bottomLeft: !top && left
              ? const Radius.circular(22)
              : Radius.zero,
          bottomRight: !top && !left
              ? const Radius.circular(22)
              : Radius.zero,
        ),
      ),
    );
  }
}