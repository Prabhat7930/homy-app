import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/text_component.dart';

Widget screenButton(
    VoidCallback callback, String text, Color buttonColor, double width,
    {double borderRadius = 24.0, bool isBorder = false}) {
  return InkWell(
    onTap: () => callback(),
    child: Container(
        height: 50.0,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: isBorder
                ? Border.all(color: Colors.white, width: 1.0)
                : Border.all(width: 0.0),
            color: buttonColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: screenText(text, 14.0, FontWeight.w400, textLightColor)),
  );
}
