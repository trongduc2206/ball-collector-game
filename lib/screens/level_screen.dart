import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2/widgets/game_text.dart';
import '../services/level_service.dart';
import '../widgets/game_button.dart';
import '../widgets/game_scaffold.dart';
import 'start_screen.dart';
import 'game_screen.dart';
import '../breakpoints.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelScreen extends StatelessWidget {
  final levelService = Get.find<LevelService>();

  @override
  Widget build(BuildContext context) {
    final levels = Iterable.generate(levelService.totalLevels).expand((level) {
      return [
        Padding(
          padding: EdgeInsets.all(16),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        GameButton(
          text:
              "Level ${level + 1}",
          onPressed: () {
            levelService.currentLevel = level;
            Get.to(GameScreen());
          },
        ),
        levelService.completedLevels.contains(level)
        ? Icon(Icons.check_circle, color: Colors.green) // Completed icon
        : Icon(Icons.circle_outlined, color: Colors.grey),  
        ],)
        // GameButton(
        //   text:
        //       "Level ${level + 1}",
        //   onPressed: () {
        //     levelService.currentLevel = level;
        //     Get.to(GameScreen());
        //   },
        // ),
        // levelService.completedLevels.contains(level)
        // ? Icon(Icons.check_circle, color: Colors.green) // Completed icon
        // : Icon(Icons.circle_outlined, color: Colors.grey),
      ];
    }).toList();

    // return GameScaffold(content: [
    //   Text("Choose a level", style: TextStyle(fontSize: 48)),
    //   ...levels,
    //   Padding(
    //     padding: EdgeInsets.all(16),
    //   ),
    //   GameButton(
    //     text: "Back to start",
    //     onPressed: () => Get.to(StartScreen()),
    //   )
    // ]);
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
                  width: 1200,
                  child:
                    LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        if(constraints.maxWidth < Breakpoints.sm) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GameText(content: "Choose a level", fontSize: 24),
                              ...levels,
                              Padding(
                                padding: EdgeInsets.all(16),
                              ),
                              GameButton(
                                text: "Back to start",
                                onPressed: () => Get.to(StartScreen()),
                              )
                            ],
                          );
                        } else if (constraints.maxWidth < Breakpoints.md) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GameText(content: "Choose a level", fontSize: 28),
                              Padding(
                                padding: EdgeInsets.all(8),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ...levels,
                                ],
                              ),
                              Padding(
                                    padding: EdgeInsets.all(16),
                              ),
                              GameButton(
                                text: "Back to start",
                                onPressed: () => Get.to(StartScreen()),
                              )
                            ],
                          );
                        } else {
                          return
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GameText(content: "Choose a level", fontSize: 32),
                                  ...levels,
                                ],
                              ),
                              Padding(
                                    padding: EdgeInsets.all(16),
                              ),
                              GameButton(
                                    text: "Back to start",
                                    onPressed: () => Get.to(StartScreen()),
                              )
                            ]
                          );
                        }
                      }
                    ),
              )
            ),
        )
    );
  }
}