import 'package:flutter/material.dart';

class CurveBackground extends CustomPainter {
  final Color color;

  CurveBackground({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, 50);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.1,
        size.width * 0.3, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.5,
        size.width * 0.45, size.height * 0.7);
    // path.quadraticBezierTo(
    //     size.width * 1, size.height * 0.9, size.width * 0.9, size.height * 1.0);
    path.quadraticBezierTo(
        size.width * 1, size.height * 0.2, size.width * 1, size.height * 0.5);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
