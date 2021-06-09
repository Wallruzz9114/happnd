import 'package:flutter/material.dart';
import 'package:happnd/components/gradient_border_painter.dart';

class GradientBorder extends StatelessWidget {
  const GradientBorder({
    Key? key,
    required double borderRadius,
    required double strokeWidth,
    required Gradient gradient,
    required Widget child,
  })  : _borderRadius = borderRadius,
        _strokeWidth = strokeWidth,
        _gradient = gradient,
        _child = child,
        super(key: key);

  final double _borderRadius;
  final double _strokeWidth;
  final Gradient _gradient;
  final Widget _child;

  @override
  CustomPaint build(BuildContext context) {
    return CustomPaint(
      painter: GradientBorderPainter(
        strokeWidth: _strokeWidth,
        radius: _borderRadius,
        gradient: _gradient,
      ),
      child: Padding(
        padding: EdgeInsets.all(_strokeWidth),
        child: _child,
      ),
    );
  }
}
