import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/text_component.dart';

Widget buildMealItem(String date, String meal) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12.0),
    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
    decoration: BoxDecoration(
      color: textInputBgColor,
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: ListTile(
      leading: screenText(date, 16.0, FontWeight.w600, secondaryColor,
          wordHeight: 1.2),
      title: screenText(meal, 16.0, FontWeight.w400, textDarkColor,
          align: TextAlign.left, wordHeight: 1.2),
      trailing: const Icon(Icons.more_vert, color: secondaryColor),
      onTap: () {},
    ),
  );
}
