import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/game.dart';
import 'package:bonfire_defense/util/drag_tile.dart';
import 'package:flutter/material.dart';

abstract class Defender extends SimpleAlly with DragGesture, DragTile {
  Paint drawVisionPaint = Paint()..color = Colors.blue.withOpacity(0.5);
  final int visionTile;
  bool _showVision = true;
  Defender({
    required super.position,
    required this.visionTile,
    required super.size,
    super.animation,
    super.initDirection,
  });

  double get radiusVision => BonfireDefense.tileSize * (visionTile * 0.8);

  void showRadiusVision(bool show) {
    _showVision = show;
    if (!show) {
      enableDrag = false;
    }
  }

  @override
  void render(Canvas canvas) {
    if (_showVision) {
      canvas.drawCircle(
        (size / 2).toOffset(),
        radiusVision,
        drawVisionPaint,
      );
    }
    super.render(canvas);
  }
}
