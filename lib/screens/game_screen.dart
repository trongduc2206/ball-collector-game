import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import '../components/ball_collector_game.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: BallCollectorGame(),
    );
  }
}