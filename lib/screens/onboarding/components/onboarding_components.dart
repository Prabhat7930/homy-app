import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/text_component.dart';

Widget onBoardingButton(
    VoidCallback callback, String text, Color buttonColor, double width) {
  return InkWell(
    onTap: () => callback(),
    child: Container(
        height: 45.0,
        width: width * 0.3,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(12.0)),
        child: screenText(text, 14.0, FontWeight.w400, textLightColor)),
  );
}
