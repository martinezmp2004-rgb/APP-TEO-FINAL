import 'dart:math';
import 'package:flutter/material.dart';

class GraficoPastel extends CustomPainter {
  final int aciertos;
  final int fallos;
  final int total;

  GraficoPastel({required this.aciertos, required this.fallos, required this.total});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;
    final strokeWidth = 28.0;

    final paintBg = Paint()
      ..color = Colors.grey[200]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, paintBg);

    if (total <= 0) return;

    if (fallos > 0) {
      final paintFallo = Paint()
        ..color = Colors.red[400]!
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.butt;

      final sweepFallos = 2 * pi * (fallos / total);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2,
        sweepFallos,
        false,
        paintFallo,
      );
    }

    if (aciertos > 0) {
      final paintAcierto = Paint()
        ..color = Colors.green[400]!
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.butt;

      final startAngle = -pi / 2 + 2 * pi * (fallos / total);
      final sweepAciertos = 2 * pi * (aciertos / total);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAciertos,
        false,
        paintAcierto,
      );
    }
  }

  @override
  bool shouldRepaint(GraficoPastel oldDelegate) => true;
}