import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';

Widget screenFloatingButton() {
  return Align(
    alignment: const Alignment(1, 0.7),
    child: InkWell(
      onTap: () {},
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: secondaryColor,
        ),
        alignment: Alignment.center,
        child: const Icon(Icons.chat_bubble_rounded,
            color: Colors.white, size: 24.0),
      ),
    ),
  );
}
