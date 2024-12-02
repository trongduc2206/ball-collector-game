import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/extensions.dart';

class GameBounds extends BodyComponent {
  @override
  Body createBody() {
    final bodyDef = BodyDef(
      type: BodyType.static,
      position: Vector2.zero(),
      userData: this,
    );

    Body gameBoundsBody = world.createBody(bodyDef);

    final gameRect = game.camera.visibleWorldRect;
    final gameBoundsVectors = [
      gameRect.topLeft.toVector2(),
      gameRect.topRight.toVector2(),
      gameRect.bottomRight.toVector2(),
      gameRect.bottomLeft.toVector2(),
    ];

    for (int i = 0; i < gameBoundsVectors.length; i++) {
      final start = gameBoundsVectors[i];
      final end = gameBoundsVectors[(i + 1) % gameBoundsVectors.length];
      gameBoundsBody.createFixture(FixtureDef(
        EdgeShape()..set(start, end),
      )..filter.categoryBits=0x10);
    }

    return gameBoundsBody;
  }
}