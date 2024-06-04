import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BonfireDefense',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BonfireDefense(
        enemyInitialPosition: Vector2(
          -1 * BonfireDefense.tileSize - BonfireDefense.tileSize / 2,
          7 * BonfireDefense.tileSize - BonfireDefense.tileSize / 2,
        ),
        enemyPath: gamePath,
        enemyQuantity: 5,
      ),
    );
  }
}

List<Vector2> get gamePath => [
      Vector2(
        6 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
        7 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
      ),
      Vector2(
        6 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
        2 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
      ),
      Vector2(
        14 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
        2 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
      ),
      Vector2(
        14 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
        6 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
      ),
      Vector2(
        20 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
        6 * BonfireDefense.tileSize + BonfireDefense.tileSize / 2,
      ),
    ];
