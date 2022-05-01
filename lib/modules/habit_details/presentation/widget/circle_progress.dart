// import 'package:flutter/material.dart';

// class CircleProgress extends StatelessWidget {
//   const CircleProgress({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomPaint(
//         painter: CirclePainter(),
//       ),
//     );
//   }
// }

// class CirclePainter extends CustomPainter {
//   var wavePaint = Paint()
//     ..color = Colors.grey
//     ..style = PaintingStyle.stroke
//     ..strokeWidth = 1.0
//     ..isAntiAlias = true;

//   var completed = Paint()
//     ..color = Colors.red
//     ..style = PaintingStyle.stroke
//     ..strokeWidth = 2.0
//     ..isAntiAlias = true;
//   @override
//   void paint(Canvas canvas, Size size) {
//     double centerX = size.width / 9.0;
//     double centerY = size.height / 9.0;
//     canvas.drawCircle(Offset(centerX, centerY), 25.0, wavePaint);

//     canvas.drawCircle(Offset(centerX, centerY), 25.0, completed);
//   }

//   @override
//   bool shouldRepaint(CirclePainter oldDelegate) {
//     return false;
//   }
// }
