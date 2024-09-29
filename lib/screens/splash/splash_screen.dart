import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homy/core/routes/routes.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void isLogin(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? userLoggedIn = prefs.getBool("userLoggedIn");
    final bool? userDetails = prefs.getBool("userDetails");

    Timer(const Duration(seconds: 2), () {
      if (userDetails != null && userDetails) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.navHostScreen, (routes) => false);
      } else if (userLoggedIn != null && userLoggedIn) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.personalDetailScreen, (routes) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.onBoardingScreen, (routes) => false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: primaryColor));
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/homy.png",
              scale: 2.0,
            ),
          ),
          Center(
            child: Text(
              textAssets[0],
              style: GoogleFonts.instrumentSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: textLightColor),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  final textAssets = <String>[
    "Expert chefs at your doorstep,\nbringing personalized meals right\nto your kitchen."
  ];
}
