import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/arrow_forward_icon_component.dart';
import 'package:homy/utils/icon_button_component.dart';
import 'package:homy/utils/text_component.dart';

class MealPlannerWidget extends StatelessWidget {
  final double height;
  final double width;
  final String containerText;
  final String buttonText;
  final VoidCallback onTap;

  const MealPlannerWidget({
    super.key,
    required this.height,
    required this.width,
    required this.containerText,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          screenText(containerText, 14.0, FontWeight.w400, textLightColor,
              align: TextAlign.start),
          const SizedBox(height: 8.0),
          screenIconButton(onTap, "Meal Planner", secondaryColor, width * 0.35,
              iconContainer(Icons.keyboard_arrow_right_rounded),
              borderRadius: 12.0, height: 40.0, textColor: Colors.white)
        ],
      ),
    );
  }
}
