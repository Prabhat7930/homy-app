import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/text_component.dart';

class HomyWorkingWidget extends StatelessWidget {
  final double height;
  final double width;
  final List<String> textAssets;
  const HomyWorkingWidget({
    super.key,
    required this.height,
    required this.width,
    required this.textAssets,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        homyText(),
        const SizedBox(height: 20.0),
        descriptionContainer(height, width, "1", textAssets[1]),
        const SizedBox(height: 12.0),
        descriptionContainer(height, width, "2", textAssets[2]),
        const SizedBox(height: 12.0),
        descriptionContainer(height, width, "3", textAssets[3]),
        const SizedBox(height: 12.0),
        descriptionContainer(height, width, "4", textAssets[4])
      ],
    );
  }

  Widget homyText() {
    return RichText(
      text: TextSpan(
          text: "How ",
          style: GoogleFonts.instrumentSans(
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
            color: textDarkColor,
          ),
          children: [
            TextSpan(
              text: "TheHomy ",
              style: GoogleFonts.instrumentSans(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                color: secondaryColor,
              ),
            ),
            TextSpan(
              text: "works?",
              style: GoogleFonts.instrumentSans(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                color: textDarkColor,
              ),
            ),
          ]),
      textAlign: TextAlign.center,
    );
  }

  Widget descriptionContainer(
      double height, double width, String number, String text) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0), color: textInputBgColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height * 0.75,
              width: height * 0.75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: secondaryColor),
              alignment: Alignment.center,
              child: screenText(number, 22.0, FontWeight.w600, textLightColor),
            ),
            const SizedBox(width: 12.0),
            screenText(text, 14.0, FontWeight.w600, textDarkColor,
                align: TextAlign.start)
          ],
        ),
      ),
    );
  }
}
