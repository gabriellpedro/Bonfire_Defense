import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/util/character_spritesheet.dart';
import 'package:flutter/material.dart';

class Orc extends SimpleEnemy with PathFinding, UseLifeBar {
  final List<Vector2> path;
  Orc({
    required super.position,
    required this.path,
  }) : super(
            size: Vector2.all(32),
            speed: 35,
            animation:
                CharacterSpritesheet(fileName: 'orc.png').getAnimation()) {
    setupPathFinding(linePathEnabled: false);
    setupLifeBar(
      barLifeDrawPosition: BarLifeDrawPosition.top,
      showLifeText: false,
      borderRadius: BorderRadius.circular(10),
      size: Vector2(16, 2),
      offset: Vector2(0, 0.8),
    );
    movementOnlyVisible = false;
  }

  @override
  void onMount() {
    moveAlongThePath(path);
    super.onMount();
  }

  @override
  Future<void> onLoad() {
    add(
      RectangleHitbox(
        isSolid: true,
        size: Vector2.all(16),
        position: size / 4,
      ),
    );
    return super.onLoad();
  }

  @override
  void onDie() {
    removeFromParent();
    super.onDie();
  }
}
