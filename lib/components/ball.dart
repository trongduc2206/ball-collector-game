import 'package:flutter/material.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/extensions.dart';
import 'ball_collector_game.dart';
import 'bomb.dart';
import 'player_paddle.dart';

class Ball extends BodyComponent<BallCollectorGame> with ContactCallbacks {
  final Vector2 initialPosition;

  Ball(this.initialPosition);

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      type: BodyType.dynamic,
      position: initialPosition,
      userData: this,
    );
    final shape = CircleShape()..radius = 1;
      final fixtureDef = FixtureDef(shape)
      ..restitution = 0.8
      ..density = 1.0
      ..filter.categoryBits = 0x04;
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()..color = Colors.green;
    canvas.drawCircle(Offset.zero, 1, paint);
  }

  @override
  void beginContact(Object other, Contact contact) {
    if(other is! Ball && other is! Bomb) {
      removeFromParent();
      if(other is PlayerPaddle) {
        game.incrementScore();
      }
      super.beginContact(other, contact);
    }
    
  }

}