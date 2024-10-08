import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/text_component.dart';

Widget screenIconButton(VoidCallback callback, String text, Color buttonColor,
    double width, Widget buttonIcon,
    {double borderRadius = 24.0,
    bool isBorder = false,
    double height = 50.0,
    Color textColor = textLightColor}) {
  return InkWell(
    onTap: () => callback(),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: isBorder
                ? Border.all(color: Colors.white, width: 1.0)
                : Border.all(width: 0.0),
            color: buttonColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            screenText(text, 14.0, FontWeight.w400, textColor),
            const SizedBox(width: 4.0),
            buttonIcon
          ],
        )),
  );
}
