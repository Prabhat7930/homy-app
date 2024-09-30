import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/arrow_forward_icon_component.dart';
import 'package:homy/utils/text_component.dart';

Widget planComponentWidget({
  required double height,
  required double width,
  required List<Color> colors,
  required String title,
  required String description,
  required VoidCallback onTap,
}) {
  return SizedBox(
    width: width,
    child: InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              gradient: LinearGradient(
                colors: colors,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(3.0), // Border width
              decoration: BoxDecoration(
                color: scaffoldColor,
                borderRadius: BorderRadius.circular(16.0),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 16.0, left: 16.0, right: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  screenText(title, 18.0, FontWeight.w600, textDarkColor),
                  const SizedBox(height: 8.0),
                  screenText(description, 14.0, FontWeight.w500, textDarkColor,
                      align: TextAlign.start),
                ],
              ),
            ),
          ),
          Positioned(
            top: height * 0.2,
            left: width * 0.7,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 70.0,
                  width: 70.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: scaffoldColor, width: 5.0),
                    borderRadius: BorderRadius.circular(100.0),
                    gradient: LinearGradient(
                      colors: colors,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
                arrowForward(height: 30.0, width: 30.0, iconSize: 28.0)
              ],
            ),
          )
        ],
      ),
    ),
  );
}
