import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2/breakpoints.dart';
import 'package:project_2/screens/instruction_screen.dart';
import 'package:project_2/widgets/game_button.dart';
import 'package:project_2/widgets/game_text.dart';
import 'level_screen.dart';

class StartScreen extends StatelessWidget {
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
                            constraints.maxWidth < Breakpoints.sm ?
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GameText(content: "Welcome To", fontSize: 18),
                                Padding(
                                  padding: EdgeInsets.all(4),
                                ),
                                GameText(content: "Ball Collector Game", fontSize: 20),
                              ],
                            ) :
                            GameText(
                              content: "Welcome to the Ball Collector Game!",
                              fontSize: constraints.maxWidth < Breakpoints.md ? 16 : 24
                            ),
                            Padding(
                              padding: EdgeInsets.all(16),
                            ),
                            constraints.maxWidth < Breakpoints.sm ?
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  child: GameText(content: "Start", fontSize: 12),
                                  onPressed: () => Get.to(LevelScreen()),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                ),
                                GameButton(text: "Instruction", onPressed: () => Get.to(InstructionScreen()))
                              ],
                            ) :
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  child: GameText(content: "Start", fontSize: 12),
                                  onPressed: () => Get.to(LevelScreen()),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                ),
                                GameButton(text: "Instruction", onPressed: () => Get.to(InstructionScreen()))
                              ],
                            )
                          ],
                        );
                    }
                  )
                )
            ),
        )
    );
  }
}