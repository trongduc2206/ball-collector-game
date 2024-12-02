import 'package:flutter/material.dart';
import 'package:project_2/widgets/game_text.dart';

class GameButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const GameButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: GameText(content: text, fontSize: 12),
    );
  }
}