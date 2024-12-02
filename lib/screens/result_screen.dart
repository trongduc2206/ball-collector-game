import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2/breakpoints.dart';
import 'package:project_2/widgets/game_text.dart';
import 'level_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  const ResultScreen({required this.score});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffa9d6e5),
                  Color(0xfff2e8cf),
                ],
              ),
            ),
          child:
            Center(
              child: 
                SizedBox(
                  width: 1500,
                  child:
                    LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            score >=15 ? 
                            GameText(content: "Level completed!", fontSize: constraints.maxWidth < Breakpoints.sm ? 16 : 32)
                            : GameText(content: "Game over!",fontSize: constraints.maxWidth < Breakpoints.sm ? 16 : 32),
                            GameText(content: score>=15? "You got $score points!" : "Try to get 15 points",fontSize: constraints.maxWidth < Breakpoints.sm ? 12 : 24),
                            Padding(
                              padding: EdgeInsets.all(16),
                            ),
                            ElevatedButton(
                              child: GameText(
                                content: score >= 15 ? "Choose next level" : "Try again",
                                fontSize: 12,
                              ),
                              onPressed: () => Get.to(LevelScreen()),
                            ),
                          ],
                        );
                      }
                    )
                )
            )
      ),
    );
  }
}