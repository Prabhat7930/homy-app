import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homy/core/theme/color_theme.dart';

Widget screenInputField(TextEditingController controller, String hintText,
    bool isText, TextInputType type,
    {int maxlines = 1, int limitDigit = 10, int limitText = 30}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: GoogleFonts.instrumentSans(
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
        color: Colors.grey,
      ),
      filled: true,
      fillColor: textInputBgColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
    ),
    keyboardType: type,
    inputFormatters: !isText
        ? [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(limitDigit),
          ]
        : [
            LengthLimitingTextInputFormatter(limitText),
          ],
    style: GoogleFonts.instrumentSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: textDarkColor,
    ),
    maxLines: maxlines,
  );
}
