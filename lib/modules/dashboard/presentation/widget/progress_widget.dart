import 'package:flutter/material.dart';

class CustomerProgressWidget extends CustomPainter {
  final Color color;
  final int fill;
  CustomerProgressWidget({required this.color, required this.fill});

  @override
  void paint(Canvas canvas, Size size) {
    const Offset startPoint = Offset(0, 0);
    Offset endPoint = Offset(size.width, 0);
    final total = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 7;
    canvas.drawLine(startPoint, endPoint, total);

    Offset p2 = Offset(size.width * (fill * 0.1), 0);
    final completed = Paint()
      ..color = color
      ..strokeWidth = 8;
    canvas.drawLine(startPoint, p2, completed);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
