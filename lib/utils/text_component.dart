import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget screenText(String text, double size, FontWeight weight, Color color,
    {TextAlign align = TextAlign.center}) {
  return Text(
    text,
    style: GoogleFonts.instrumentSans(
        fontSize: size, fontWeight: weight, color: color),
    textAlign: align,
  );
}
