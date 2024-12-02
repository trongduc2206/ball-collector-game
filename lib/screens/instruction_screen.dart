import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2/screens/start_screen.dart';
import 'package:project_2/widgets/game_button.dart';
import 'package:project_2/widgets/game_text.dart';

class InstructionScreen extends StatelessWidget {
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GameText(
                                content: "Try to get 15 points to complete each level.",
                                fontSize: 24
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                              ),
                              GameText(
                                content: "Get 1 point for each green ball you catch with your paddle.",
                                fontSize: 12
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                              ),
                              GameText(
                                content: "Try top avoid the red balls, each of them will subtract 1 point.",
                                fontSize: 12
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                              ),
                              GameText(
                                content: "There will be 2 yellow balls in a game that can help you get 4 points for each",
                                fontSize: 12
                              ),
                              Padding(
                                padding: EdgeInsets.all(16),
                              ),
                              GameButton(text: "Back to start", onPressed: () => Get.to(StartScreen()))
                            ],
                          )
                          
                      )
                  ),
              )
          );
    }

}