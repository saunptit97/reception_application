import 'package:flutter/material.dart';
import 'dart:io';

import '../../domain/face_detect_offset.dart';

class ImageRectangleDrawer extends StatelessWidget {
  final String imagePath;
  final List<FaceDetectOffset> points;

  ImageRectangleDrawer({super.key, required this.imagePath, required this.points});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        foregroundPainter: RectanglePainter(
          points: points,
        ),
        child: Image.file(
          File(imagePath),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class RectanglePainter extends CustomPainter {
  final List<FaceDetectOffset> points ;

  RectanglePainter({super.repaint, required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    // Define the rectangle properties (modify as needed)
    final Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    // Define the rectangle coordinates (modify as needed)
    for (var element in points) {
      final Rect rect = Rect.fromLTWH(
        element.x.toDouble(),
        element.y.toDouble(),
        (element.w.toDouble() - element.x.toDouble()),
        (element.h.toDouble() - element.y.toDouble()),
      );
      print('rect');
      print(rect);
      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}