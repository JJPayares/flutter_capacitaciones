import 'package:flutter/material.dart';

class CustomCard extends ShapeBorder {
  const CustomCard({
    required this.borderRadius,
    required this.holeSize,
    this.side = BorderSide.none,
  });

  final Radius borderRadius;
  final BorderSide side;
  final double holeSize;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (side != BorderSide.none) {
      canvas.drawPath(
        _getPath(rect),
        side.toPaint(),
      );
    }
  }

  Path _getPath(Rect rect) {
    return Path.combine(
      PathOperation.difference,
      Path()
        ..addRRect(RRect.fromRectAndRadius(rect, borderRadius))
        ..close(),
      Path()
        ..addOval(Rect.fromCircle(
          center: Offset(rect.width - holeSize, rect.height - holeSize),
          radius: holeSize,
        ))
        ..close(),
    );
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(RRect.fromRectAndRadius(rect, borderRadius));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _getPath(rect);
  }

  @override
  ShapeBorder scale(double t) => this;
}
