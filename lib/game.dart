import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/components/archer.dart';
import 'package:bonfire_defense/components/game_controller.dart';
import 'package:bonfire_defense/components/widgets/start_button.dart';
import 'package:bonfire_defense/util/end_game_sensor.dart';
import 'package:flutter/material.dart';

class BonfireDefense extends StatefulWidget {
  static const tileSize = 16.0;
  final Vector2 enemyInitialPosition;
  final List<Vector2> enemyPath;
  final int enemyQuantity;
  final int countEnemyPermite;

  const BonfireDefense({
    super.key,
    required this.enemyInitialPosition,
    required this.enemyPath,
    required this.enemyQuantity,
    this.countEnemyPermite = 1,
  });

  @override
  State<BonfireDefense> createState() => _BonfireDefenseState();
}

class _BonfireDefenseState extends State<BonfireDefense> {
  late GameController controller;

  get enemyQuantity => 0;

  @override
  void initState() {
    controller = GameController(
      enemyInitialPosition: widget.enemyInitialPosition,
      enemyPath: widget.enemyPath,
      maxEnemy: widget.enemyQuantity,
      countEnemyPermite: widget.countEnemyPermite,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      map: WorldMapByTiled(
        WorldMapReader.fromAsset('map/map.tmj'),
        objectsBuilder: {
          'EndGame': (properties) {
            return EndGameSensor(
              position: properties.position,
              size: properties.size,
            );
          }
        },
      ),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        initialMapZoomFit: InitialMapZoomFitEnum.fitWidth,
      ),
      components: [
        Archer(
          position: Vector2(
            1 * BonfireDefense.tileSize - BonfireDefense.tileSize / 2,
            1 * BonfireDefense.tileSize - BonfireDefense.tileSize / 2,
          ),
        ),
        Archer(
          position: Vector2(
            1 * BonfireDefense.tileSize - BonfireDefense.tileSize / 2,
            2 * BonfireDefense.tileSize - BonfireDefense.tileSize / 2,
          ),
        ),
        controller,
      ],
      overlayBuilderMap: {
        StartButton.overlayName: (context, game) =>
            StartButton(controller: controller),
      },
      initialActiveOverlays: [
        StartButton.overlayName,
      ],
    );
  }
}
