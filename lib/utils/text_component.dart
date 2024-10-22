import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homy/core/theme/color_theme.dart';

Widget screenText(String text, double size, FontWeight weight, Color color,
    {TextAlign align = TextAlign.center,
    double? wordHeight,
    bool underline = false}) {
  return Text(
    text,
    style: GoogleFonts.instrumentSans(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: wordHeight,
      decoration: underline == true ? TextDecoration.underline : null,
      decorationColor: underline == true ? secondaryColor : null,
    ),
    textAlign: align,
  );
}
