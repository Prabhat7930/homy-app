import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/button_component.dart';
import 'package:homy/utils/text_component.dart';

Widget locationWidget(double width) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/icons/pin.png", scale: 2.0),
          const SizedBox(width: 2.0),
          screenText("mig-38, vidyanagar,\nBangalore", 14.0, FontWeight.w400,
              textDarkColor),
        ],
      ),
      screenButton(() {}, "Edit Location", secondaryColor, width,
          height: 40.0, borderRadius: 12.0)
    ],
  );
}
