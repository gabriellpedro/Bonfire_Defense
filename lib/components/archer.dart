import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/game.dart';
import 'package:bonfire_defense/util/character_spritesheet.dart';
import 'package:bonfire_defense/util/defenders.dart';
import 'package:bonfire_defense/util/drag_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Archer extends Defender {
  Archer({
    required super.position,
  }) : super(
          size: Vector2.all(32),
          animation:
              CharacterSpritesheet(fileName: 'archer.png').getAnimation(),
          initDirection: Direction.down,
          visionTile: 2,
        );

  @override
  void update(double dt) {
    seeComponentType<Enemy>(
        observed: (enemies) {
          if (checkInterval('attack', 1500, dt)) {
            _executeAttack(enemies.first);
          }
        },
        radiusVision: radiusVision);

    super.update(dt);
  }

  void _executeAttack(Enemy enemy) {
    final enemyDirection = getComponentDirectionFromMe(enemy);
    animation?.playOnceOther('attack-range-${enemyDirection.name}');
    enemy.receiveDamage(AttackOriginEnum.PLAYER_OR_ALLY, 35, Null);
  }
}
