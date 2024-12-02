import 'package:flutter/material.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/extensions.dart';
import 'package:flame/events.dart';

import 'ball_collector_game.dart';

class PlayerPaddle extends BodyComponent<BallCollectorGame> with DragCallbacks {
  final Vector2 initialPosition;
  final double width;
  final double height;

  PlayerPaddle({
    required this.initialPosition,
    this.width = 4.0,
    this.height = 3.0,
  });

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      type: BodyType.kinematic,
      position: initialPosition,
      userData: this,
    );

    final shape = PolygonShape()
      ..setAsBoxXY(width / 2, height / 2);

    final fixtureDef = FixtureDef(shape)
      ..density = 1.0
      ..friction = 0.3
      ..restitution = 0.0
      ..filter.categoryBits = 0x08;

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final paint = Paint()..color = Colors.blue;
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset.zero,
        width: width,
        height: height,
      ),
      paint,
    );
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    final delta = Vector2(event.localDelta.x, 0);

    final newPosition = body.position + delta;

    if (newPosition.x < camera.visibleWorldRect.left || newPosition.x > camera.visibleWorldRect.right) {
      return;
    }

    body.setTransform(newPosition, 0);
  }
}