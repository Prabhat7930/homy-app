import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/arrow_forward_icon_component.dart';
import 'package:homy/utils/text_component.dart';

class StackText extends StatelessWidget {
  final double height;
  final double width;
  final String containerText;
  final String buttonText;
  final VoidCallback onTap;

  const StackText({
    super.key,
    required this.height,
    required this.width,
    required this.containerText,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: height * 0.7,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: screenText(
                containerText, 14.0, FontWeight.w400, textLightColor,
                align: TextAlign.start),
          ),
          Positioned(
            top: height * 0.6,
            child: InkWell(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: scaffoldColor, width: 6.0),
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    screenText(
                        buttonText, 14.0, FontWeight.w400, textLightColor,
                        align: TextAlign.start),
                    const SizedBox(width: 4.0),
                    arrowForward()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
