import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/text_component.dart';

Widget planComponentWidget({
  required double height,
  required double width,
  required String imagePath,
  required String title,
  required String planType,
  required String morningPrice,
  required String eveningPrice,
  required String description,
  required Function(String) onPlanTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: InkWell(
      onTap: () => onPlanTap(planType),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                imagePath,
                scale: 2.0,
                fit: BoxFit.cover,
                width: width,
                height: height,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: height * 0.4,
                  width: width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0)),
                    color: Color(0x90000000),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      screenText(title, 18.0, FontWeight.w600, textLightColor),
                      const SizedBox(height: 4.0),
                      priceContainer(height * 0.08, width * 0.65, morningPrice,
                          eveningPrice),
                      const SizedBox(height: 4.0),
                      screenText(
                          description, 13.0, FontWeight.w500, textLightColor),
                    ],
                  ),
                ),
                Container(
                  height: height * 0.6,
                  width: width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0)),
                    color: Color(0x40000000),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child:
                  viewMoreContainer(planType, onPlanTap, height * 0.12, width),
            )
          ],
        ),
      ),
    ),
  );
}

Widget priceContainer(
    double height, double width, String morningPrice, String eveningPrice) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0), color: primaryColor),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        screenText(
            "Morning ₹$morningPrice", 13.0, FontWeight.w500, textLightColor),
        const SizedBox(width: 8.0),
        Container(height: height * 0.8, width: 1.0, color: Colors.grey),
        const SizedBox(width: 8.0),
        screenText(
            "Evening ₹$eveningPrice", 13.0, FontWeight.w500, textLightColor),
      ],
    ),
  );
}

Widget viewMoreContainer(
  String planType,
  void Function(String) onTap,
  double height,
  double width,
) {
  return InkWell(
    onTap: () => onTap(planType),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    child: Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0)),
        color: secondaryColor,
      ),
      alignment: Alignment.center,
      child: screenText("View More", 16.0, FontWeight.w400, textLightColor),
    ),
  );
}
