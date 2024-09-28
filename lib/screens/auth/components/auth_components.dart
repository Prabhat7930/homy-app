import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/text_component.dart';
import 'package:pinput/pinput.dart';

Widget authButton(
    VoidCallback callback, String text, Color buttonColor, double width) {
  return InkWell(
    onTap: () => callback(),
    child: Container(
        height: 40.0,
        width: width * 0.25,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(12.0)),
        child: screenText(text, 12.0, FontWeight.w400, textLightColor)),
  );
}

Widget buildPinput(TextEditingController otpController) {
  return Pinput(
    length: 6,
    controller: otpController,
    defaultPinTheme: PinTheme(
      height: 52.0,
      width: 52.0,
      textStyle: GoogleFonts.instrumentSans(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: textDarkColor,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: secondaryColor, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    isCursorAnimationEnabled: false,
    autofocus: true,
    closeKeyboardWhenCompleted: true,
  );
}
