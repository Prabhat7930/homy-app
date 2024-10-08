import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:homy/core/routes/routes.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/screens/home/components/homy_working_component.dart';
import 'package:homy/screens/home/components/location_component.dart';
import 'package:homy/screens/home/components/plan_component.dart';
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 12.0),
        child: SingleChildScrollView(
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
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
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
              const SizedBox(height: 40.0),
              planContainerWidget(
                  height, width, "assets/images/comfort.png", "Homy Comfort"),
              const SizedBox(height: 8.0),
              planContainerWidget(
                  height, width, "assets/images/fusion.png", "Homy Fusion"),
              const SizedBox(height: 8.0),
              planContainerWidget(
                  height, width, "assets/images/wellness.png", "Homy Wellness"),
              const SizedBox(height: 40.0),
              SizedBox(
                height: height * 0.3,
                width: width * 0.9,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    MealPlannerWidget(
                        height: height * 0.2,
                        width: width,
                        containerText: textAssets[0],
                        buttonText: "Meal Planner",
                        onTap: onMealPlannerButton),
                    Positioned(
                        left: width * 0.1,
                        child: Image.asset("assets/images/phone3.png",
                            scale: 2.0)),
                  ],
                ),
              ),
              const SizedBox(height: 32.0),
              HomyWorkingWidget(
                  height: height * 0.08,
                  width: width * 0.85,
                  textAssets: textAssets),
              const SizedBox(height: 20.0),
            ],
          ),
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
    "Schedule meals, so\nyour chef knows what\nto cook!",
    "Guest Diagnosis",
    "Kitchen inspection by our\nHead supervisor visit",
    "Upto 2 days of supervisor visit\nwith your regular chef",
    "Enjoy your luxury dining\nexperiences at your Home :)"
  ];
}
