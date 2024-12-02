import 'package:flutter/material.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/extensions.dart';
import 'ball_collector_game.dart';
import 'ball.dart';
import 'player_paddle.dart';

class Bomb extends BodyComponent<BallCollectorGame> with ContactCallbacks {
  final Vector2 initialPosition;
  var lifeTime = 8.0;
  var restitution = 1.0;
  
  Bomb(this.initialPosition, this.lifeTime, this.restitution);

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      type: BodyType.dynamic,
      position: initialPosition,
      userData: this,
    );
    final shape = CircleShape()..radius = 1;
      final fixtureDef = FixtureDef(shape)
      ..restitution = restitution
      ..density = 1.0
      ..filter.categoryBits = 0x02
      ..filter.maskBits = 0xFF & ~0x01;
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()..color = Colors.red;
    canvas.drawCircle(Offset.zero, 1, paint);
  }

  @override
  void beginContact(Object other, Contact contact) {
    if(other is! Ball) {
      if(other is PlayerPaddle) {
        game.decrementScore();
        removeFromParent();
      }
    }
    
    super.beginContact(other, contact);
  }

  @override
  void update(double dt) {
    lifeTime -=dt;
    if (lifeTime <= 0.0) {
      removeFromParent();
    }
  }
}