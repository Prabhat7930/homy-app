import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homy/core/routes/routes.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/button_component.dart';
import 'package:homy/utils/text_component.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            height: height,
            width: width,
            "assets/images/salad1.png",
            fit: BoxFit.cover,
          ),
          Container(
            height: height,
            width: width,
            color: imageCover,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                screenText(
                    textAssets[0], 22.0, FontWeight.w700, textLightColor),
                const SizedBox(height: 12.0),
                screenText(
                    textAssets[1], 14.0, FontWeight.w400, textLightColor),
                const SizedBox(height: 16.0),
                screenButton(() {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.enterPhoneScreen, (route) => false);
                }, "Sign in", secondaryColor, width * 0.8),
                const SizedBox(height: 40.0)
              ],
            ),
          ),
        ],
      ),
    );
  }

  final textAssets = const [
    "Welcome to The Homy",
    "Get ready to discover and order delicious meals from\nyour favorite restaurants with Foodie Delight."
  ];
}
