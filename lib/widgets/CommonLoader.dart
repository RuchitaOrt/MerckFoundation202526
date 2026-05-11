import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';

class CommonLoader extends StatefulWidget {
  final String text;

  const CommonLoader({
    super.key,
    this.text = "Loading...",
  });

  @override
  State<CommonLoader> createState() => _CommonLoaderState();
}

class _CommonLoaderState extends State<CommonLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// SMALL DOTTED LOADER
          SizedBox(
            width: 38,
            height: 38,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: CustomPaint(
                    painter: DotSpinnerPainter(),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 14),

          /// TEXT
          Text(
            widget.text,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Customcolor.text_blue,
            ),
          ),
        ],
      ),
    );
  }
}

class DotSpinnerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    const int dots = 8;
    final double radius = size.width / 2.8;

    for (int i = 0; i < dots; i++) {
      final angle = (2 * math.pi / dots) * i;

      final dotOffset = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );

      final paint = Paint()
        ..color = Customcolor.text_blue.withOpacity(
          (i + 1) / dots,
        );

      canvas.drawCircle(dotOffset, 3, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}