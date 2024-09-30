import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';

Widget arrowForward(
    {double height = 16.0, double width = 16.0, double iconSize = 14.0}) {
  return Container(
    height: height,
    width: width,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.0),
      color: Colors.white,
    ),
    child: Icon(
      Icons.keyboard_arrow_right_sharp,
      size: iconSize,
      color: secondaryColor,
    ),
  );
}
