import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homy/core/routes/routes.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/screens/onboarding/components/onboarding_components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/text_component.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int pageCounter = 0;

  void onNextButtonTap() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    if (pageCounter == 1) {
      Navigator.pushNamed(context, Routes.welcomeScreen);
    }
  }

  void onSkipButtonTap() {
    Navigator.pushNamed(context, Routes.welcomeScreen);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: primaryColor));
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [primaryColor, secondaryColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) {
            setState(() {
              pageCounter = index;
            });
          },
          children: [
            Image.asset(
              imageAssets[0],
              scale: 2.0,
            ),
            Image.asset(
              imageAssets[1],
              scale: 2.0,
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: height * 0.3,
            width: width,
            decoration: const BoxDecoration(color: primaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 32.0),
                screenText(pageCounter == 0 ? textAssets[0] : textAssets[2],
                    22.0, FontWeight.w700, textLightColor),
                const SizedBox(height: 12.0),
                screenText(pageCounter == 0 ? textAssets[1] : textAssets[3],
                    14.0, FontWeight.w400, textLightColor),
                const SizedBox(height: 28.0),
                AnimatedSmoothIndicator(
                  activeIndex: pageCounter,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                      expansionFactor: 5,
                      dotWidth: 8.0,
                      spacing: 4.0,
                      dotHeight: 8.0,
                      strokeWidth: 1.0,
                      dotColor: Colors.white,
                      activeDotColor: secondaryColor),
                ),
                const SizedBox(height: 28.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    onBoardingButton(
                        onSkipButtonTap, "Skip", Colors.transparent, width),
                    const SizedBox(width: 20.0),
                    onBoardingButton(
                        onNextButtonTap, "Next", secondaryColor, width)
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
  }

  final imageAssets = [
    "assets/images/phone1.png",
    "assets/images/phone2.png",
  ];

  final textAssets = [
    "Diet Plan & Meal Calendar",
    "Your personal chef at home – tailored meals, global\nflavors, and expert care, all in one app.",
    "Benefits of various plans",
    "Enjoy a variety of meal plans crafted to suit your taste, schedule, and lifestyle."
  ];
}
