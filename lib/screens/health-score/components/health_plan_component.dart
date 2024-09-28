import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/button_component.dart';
import 'package:homy/utils/text_component.dart';

Widget healthScoreContainer(
  double height,
  double width,
  List<String> screenTextAsset,
  VoidCallback homeCallback,
  VoidCallback planCallback,
) {
  return Container(
    height: height,
    width: width,
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0), color: primaryColor),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IntrinsicWidth(
          stepWidth: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              screenText(
                  "Score Analysis", 14.0, FontWeight.bold, textLightColor),
              screenText(
                  screenTextAsset[1], 14.0, FontWeight.normal, textLightColor,
                  align: TextAlign.start),
              const SizedBox(height: 8.0),
              screenText(
                  "Recommendation", 14.0, FontWeight.bold, textLightColor),
              screenText(
                  screenTextAsset[2], 14.0, FontWeight.normal, textLightColor,
                  align: TextAlign.start),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              screenButton(
                  homeCallback, "Go Home", Colors.transparent, width * 0.3,
                  borderRadius: 12.0, isBorder: true),
              screenButton(planCallback, "Buy Homy Wellness", secondaryColor,
                  width * 0.5,
                  borderRadius: 12.0),
            ],
          ),
        )
      ],
    ),
  );
}
