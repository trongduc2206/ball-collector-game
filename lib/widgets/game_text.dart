import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameText extends StatelessWidget {
  final String content;
  final double fontSize;
  const GameText({required this.content, required this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(content, style: GoogleFonts.pressStart2p(fontSize: fontSize));
  }
}