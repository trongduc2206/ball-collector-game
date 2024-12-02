import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/extensions.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async' as dart_async;

import '../services/level_service.dart';
import '../screens/result_screen.dart';
import 'ball.dart';
import 'bomb.dart';
import 'bonus_ball.dart';
import 'player_paddle.dart';
import 'game_bound.dart';


class BallCollectorGame extends Forge2DGame {
    BallCollectorGame()
    : super(
        camera: CameraComponent.withFixedResolution(
          width: 800,
          height: 600,
        ),
        gravity: Vector2(0, 20.0)
      );

  late int score;
  late TextComponent scoreDisplay;
  var gameFinished = false;
  var timeLeft = 30.0;
  late TextComponent timeLeftDisplay;
  late TextComponent levelDisplay;
  final random = Random();

  final levelService = Get.find<LevelService>();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    score = 0;

    final paddlePosition = Vector2(0, camera.visibleWorldRect.bottom);
    world.add(GameBounds());
    world.add(PlayerPaddle(initialPosition: paddlePosition));

    scoreDisplay = TextComponent(
      text: 'Score: ${score}/15',
      position: Vector2(camera.visibleWorldRect.left, camera.visibleWorldRect.top + 1),
      textRenderer: TextPaint(style: GoogleFonts.pressStart2p(color: Colors.white, fontSize: 1)),
    );
    world.add(scoreDisplay);

    timeLeftDisplay = TextComponent(
      text: 'Time left: ${timeLeft}s',
      position: Vector2(camera.visibleWorldRect.right - 17, camera.visibleWorldRect.top + 1),
      textRenderer: TextPaint(style: GoogleFonts.pressStart2p(color: Colors.white, fontSize: 1)),
    );
    world.add(timeLeftDisplay);

    levelDisplay = TextComponent(
      text: 'Level ${levelService.currentLevel + 1}',
      position: camera.visibleWorldRect.topCenter.toVector2(),
      textRenderer: TextPaint(style: GoogleFonts.pressStart2p(color: Colors.white, fontSize: 1)),
    );
    world.add(levelDisplay);


    dart_async.Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if (gameFinished) {
        timer.cancel();
      }
      final randomX = (camera.visibleWorldRect.width / 2) * (0.5 - random.nextDouble());
      final position = Vector2(randomX, camera.visibleWorldRect.top + 10);
      world.add(Ball(position));

    });

    dart_async.Timer.periodic(const Duration(milliseconds: 8000), (timer) {
      if (gameFinished) {
        timer.cancel();
      }
      final randomX = (camera.visibleWorldRect.width / 2) * (0.5 - random.nextDouble());
      final position = Vector2(randomX, camera.visibleWorldRect.top + 10);
      world.add(BonusBall(position));

    });
    
    var bombTimer = levelService.currentLevel == 2 ? 1200 : (levelService == 1 ? 1800 : 2200);
    dart_async.Timer.periodic(Duration(milliseconds: bombTimer), (timer) {
      if (gameFinished) {
        timer.cancel();
      }
      final randomX = (camera.visibleWorldRect.width / 2) * (0.5 - random.nextDouble());
      final position = Vector2(randomX, camera.visibleWorldRect.top + 10);
      if(levelService.currentLevel == 0) {
        world.add(Bomb(position, 8.0, 1.2));
      } else if (levelService.currentLevel == 1) {
        world.add(Bomb(position, 14.0, 1.5));
      } else if (levelService.currentLevel == 2) {
        world.add(Bomb(position, 20.0, 1.9));
      }
    });

  }

  @override
  void update(double dt) {
    super.update(dt);

    timeLeft -= dt;
    timeLeftDisplay.text = 'Time left: ${timeLeft.toStringAsFixed(1)}s';
    if (timeLeft <= 0 && !gameFinished) {
      if (score >= 15) {
        final levelService = Get.find<LevelService>();
        levelService.completeLevel(levelService.currentLevel);
      }
      finishGame();
    }
  }

  incrementScore() {
    score++;
    scoreDisplay.text = 'Score: ${score}/15';
  }

  incrementScoreBy(int inc) {
    score+=inc;
    scoreDisplay.text = 'Score: ${score}/15';
  }

  decrementScore() {
    if(score >=1 ) {
      score--;
    }
    scoreDisplay.text = 'Score: ${score}/15';
  }

  finishGame() {
    gameFinished = true;
    Get.offAll(() => ResultScreen(score: score));
  }
}