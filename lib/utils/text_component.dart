import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget screenText(String text, double size, FontWeight weight, Color color,
    {TextAlign align = TextAlign.center, bool wordHeight = false}) {
  return Text(
    text,
    style: GoogleFonts.instrumentSans(
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: wordHeight == true ? 1.0 : null),
    textAlign: align,
  );
}
