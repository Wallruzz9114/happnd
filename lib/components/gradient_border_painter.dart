import 'package:flutter/material.dart';

class GradientBorderPainter extends CustomPainter {
  GradientBorderPainter({
    required double strokeWidth,
    required double radius,
    required Gradient gradient,
  })  : _strokeWidth = strokeWidth,
        _radius = radius,
        _gradient = gradient;

  final Paint _paint = Paint();
  final double _radius;
  final double _strokeWidth;
  final Gradient _gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    final outerRect = Offset.zero & size;
    final outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(_radius));

    // create inner rectangle smaller by strokeWidth
    final innerRect = Rect.fromLTWH(_strokeWidth, _strokeWidth,
        size.width - _strokeWidth * 2, size.height - _strokeWidth * 2);
    final innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(_radius - _strokeWidth));

    // apply gradient shader
    _paint.shader = _gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    final path1 = Path()..addRRect(outerRRect);
    final path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
