import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/text_component.dart';

Widget planContainerWidget(
    double height, double width, String imagePath, String text) {
  return Container(
    height: height * 0.08,
    width: width,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
    child: Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.asset(imagePath,
              scale: 2.0, fit: BoxFit.cover, width: width),
        ),
        Container(
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Color(0x80000000),
          ),
        ),
        screenText(text, 20.0, FontWeight.bold, textLightColor)
      ],
    ),
  );
}
