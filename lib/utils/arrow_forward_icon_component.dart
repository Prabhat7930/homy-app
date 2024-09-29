import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';

Widget arrowForward() {
  return Container(
    height: 16.0,
    width: 16.0,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.0),
      color: Colors.white,
    ),
    child: const Icon(
      Icons.keyboard_arrow_right_sharp,
      size: 14.0,
      color: secondaryColor,
    ),
  );
}
