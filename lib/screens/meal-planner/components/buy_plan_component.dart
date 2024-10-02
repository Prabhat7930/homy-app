import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homy/core/routes/route_arguments.dart';
import 'package:homy/core/routes/routes.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/arrow_forward_icon_component.dart';
import 'package:homy/utils/icon_button_component.dart';

class BuyPlanPage extends StatelessWidget {
  const BuyPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    void onViewPlanButtonTap() {
      Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.navHostScreen,
          arguments: NavHostScreenArgs(currentIndex: 1),
          (route) => false);
    }

    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 32.0,
              width: 32.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: primaryColor,
              ),
              child: const Icon(
                Icons.calendar_today_rounded,
                color: Colors.white,
                size: 16.0,
              ),
            ),
            const SizedBox(width: 4.0),
            Container(
              height: 32.0,
              width: 32.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: primaryColor,
              ),
              child: const Icon(
                Icons.restaurant_menu,
                color: Colors.white,
                size: 16.0,
              ),
            )
          ],
        ),
        const SizedBox(height: 16.0),
        purchaseText(),
        const SizedBox(height: 32.0),
        screenIconButton(
            onViewPlanButtonTap,
            "View Plans",
            secondaryColor,
            width * 0.35,
            borderRadius: 12.0,
            iconContainer(Icons.keyboard_arrow_right_rounded))
      ],
    );
  }

  Widget purchaseText() {
    return RichText(
      text: TextSpan(
          text: "Purchase a plan to access\nthe ",
          style: GoogleFonts.instrumentSans(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: textDarkColor,
          ),
          children: [
            TextSpan(
              text: "Meal Planner ",
              style: GoogleFonts.instrumentSans(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: secondaryColor,
              ),
            ),
            TextSpan(
              text: "feature.",
              style: GoogleFonts.instrumentSans(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: textDarkColor,
              ),
            ),
          ]),
      textAlign: TextAlign.center,
    );
  }
}
