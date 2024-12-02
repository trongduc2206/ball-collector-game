import 'package:flutter/material.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/extensions.dart';
import 'ball_collector_game.dart';
import 'ball.dart';
import 'bomb.dart';
import 'player_paddle.dart';

class BonusBall extends BodyComponent<BallCollectorGame> with ContactCallbacks {
  final Vector2 initialPosition;

  BonusBall(this.initialPosition);

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      type: BodyType.dynamic,
      position: initialPosition,
      userData: this,
    );
    final shape = CircleShape()..radius = 0.7;
      final fixtureDef = FixtureDef(shape)
      ..restitution = 0.8
      ..density = 1.0
      ..filter.categoryBits = 0x01
      ..filter.maskBits = 0xFF & ~0x02;
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()..color = Colors.yellow;
    canvas.drawCircle(Offset.zero, 0.7, paint);
  }

  @override
  void beginContact(Object other, Contact contact) {
    if(other is! Ball && other is! Bomb) {
      removeFromParent();
      if(other is PlayerPaddle) {
        game.incrementScoreBy(4);
      }
      super.beginContact(other, contact);
    }
  }
}