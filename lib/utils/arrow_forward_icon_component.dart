import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';

Widget iconContainer(
  IconData containerIcon, {
  double height = 16.0,
  double width = 16.0,
  double iconSize = 14.0,
  Color containerColor = Colors.white,
  Color iconColor = secondaryColor,
}) {
  return Container(
    height: height,
    width: width,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.0),
      color: containerColor,
    ),
    child: Icon(
      containerIcon,
      size: iconSize,
      color: iconColor,
    ),
  );
}
