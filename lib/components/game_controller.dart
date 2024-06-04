import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/components/orc.dart';
import 'package:bonfire_defense/components/widgets/start_button.dart';
import 'package:bonfire_defense/game.dart';
import 'package:bonfire_defense/util/defenders.dart';
import 'package:bonfire_defense/util/end_game_sensor.dart';
import 'package:flutter/material.dart';

class GameController extends GameComponent {
  final Vector2 enemyInitialPosition;
  final List<Vector2> enemyPath;
  final int maxEnemy;
  final int countEnemyPermite;

  int _countEnemy = 0;

  bool running = false;

  GameController({
    required this.enemyInitialPosition,
    required this.enemyPath,
    required this.maxEnemy,
    required this.countEnemyPermite,
  });

  void startStage() {
    running = true;
    gameRef.overlays.remove(StartButton.overlayName);
    gameRef.query<Defender>().forEach((element) {
      element.showRadiusVision(false);
    });
  }

  @override
  void update(double dt) {
    if (running) {
      if (_countEnemy < maxEnemy) {
        if (checkInterval('addsEnemy', 4500, dt)) {
          _addEnemy();
        }
      }

      if (checkInterval('checkEndGame', 1000, dt)) {
        _checkEndGame();
      }
    }

    super.update(dt);
  }

  void _addEnemy() {
    gameRef.add(
      Orc(
        position: Vector2(
          enemyInitialPosition.x - BonfireDefense.tileSize / 2,
          enemyInitialPosition.y - BonfireDefense.tileSize / 2,
        ),
        path: enemyPath,
      ),
    );
    _countEnemy++;
  }

  void _checkEndGame() {
    if (maxEnemy == _countEnemy) {
      final enemies = gameRef.query<Enemy>();
      if (enemies.isEmpty) {
        final gameSensor = gameRef.query<EndGameSensor>().first;
        if (gameSensor.counter > countEnemyPermite) {
          showDialogEndGame('Acabou!');
        } else {
          showDialogEndGame('Você ganhou!');
        }
      }
    }
  }

  void showDialogEndGame(String texto) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(texto),
          );
        });
  }
}
