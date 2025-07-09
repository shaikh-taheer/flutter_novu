import 'package:flutter/material.dart';

class BellIconPainter extends CustomPainter {
  final Color color;

  BellIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final Paint fillPaint = Paint()
      ..color = color.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    // Draw bell shape
    final Path bellPath = Path()
      ..moveTo(centerX - 20, centerY)
      ..quadraticBezierTo(
        centerX - 20,
        centerY - 30,
        centerX,
        centerY - 30,
      )
      ..quadraticBezierTo(
        centerX + 20,
        centerY - 30,
        centerX + 20,
        centerY,
      )
      ..lineTo(centerX + 25, centerY + 20)
      ..lineTo(centerX - 25, centerY + 20)
      ..close();

    // Draw waves
    for (int i = 1; i <= 3; i++) {
      final double opacity = (1 - (i / 4));
      final Paint wavePaint = Paint()
        ..color = color.withOpacity(opacity * 0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;

      final Path wavePath = Path()
        ..addArc(
          Rect.fromCircle(
            center: Offset(centerX, centerY - 10),
            radius: 25.0 + (i * 10),
          ),
          -0.8,
          1.6,
        );

      canvas.drawPath(wavePath, wavePaint);
    }

    // Draw bell
    canvas.drawPath(bellPath, fillPaint);
    canvas.drawPath(bellPath, paint);

    // Draw bell handle
    canvas.drawLine(
      Offset(centerX - 5, centerY + 20),
      Offset(centerX + 5, centerY + 20),
      paint,
    );
    canvas.drawLine(
      Offset(centerX, centerY + 20),
      Offset(centerX, centerY + 25),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
