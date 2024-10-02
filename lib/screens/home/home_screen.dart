import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:homy/core/routes/routes.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/screens/home/components/location_component.dart';
import 'package:homy/screens/home/components/stack_text_component.dart';
import 'package:homy/utils/appbar_component.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselSliderController bannerController = CarouselSliderController();

  int bannerIndex = 0;

  void onMealPlannerButton() {
    Navigator.pushNamed(context, Routes.mealPlannerScreen);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: screenAppBar(context, showProfile: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            locationWidget(width * 0.3),
            const SizedBox(height: 16.0),
            CarouselSlider(
                items: bannerItems,
                options: CarouselOptions(
                  height: height * 0.15,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.4,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      bannerIndex = index;
                    });
                  },
                )),
            const SizedBox(height: 8.0),
            AnimatedSmoothIndicator(
              activeIndex: bannerIndex,
              count: bannerItems.length,
              effect: const WormEffect(
                  dotWidth: 6.0,
                  spacing: 4.0,
                  dotHeight: 6.0,
                  strokeWidth: 1.0,
                  dotColor: Color(0xFFC1C1C1),
                  activeDotColor: secondaryColor),
            ),
            SizedBox(
              width: width,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Positioned(
                    top: 50,
                    right: width * 0.3,
                    child: StackText(
                        height: height * 0.15,
                        width: width,
                        containerText: textAssets[0],
                        buttonText: "My Diet Plan",
                        onTap: () {}),
                  ),
                  Image.asset("assets/images/bowl_hand.png", scale: 2.0)
                ],
              ),
            ),
            SizedBox(
              width: width * 0.9,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Image.asset("assets/images/phone3.png", scale: 2.0),
                  Positioned(
                    left: width * 0.25,
                    child: StackText(
                        height: height * 0.15,
                        width: width,
                        containerText: textAssets[1],
                        buttonText: "Meal Planner",
                        onTap: onMealPlannerButton),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20.0)
          ],
        ),
      ),
    );
  }

  List<Widget> bannerItems = [
    Image.asset("assets/images/banner.png"),
    Image.asset("assets/images/banner.png"),
    Image.asset("assets/images/banner.png"),
  ];

  final List<String> textAssets = [
    "Find the perfect balance with       \na custom diet!",
    "Schedule meals, so your chef\nknows what to cook!"
  ];
}
