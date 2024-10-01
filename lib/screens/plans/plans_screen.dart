import 'package:flutter/material.dart';
import 'package:homy/core/routes/route_arguments.dart';
import 'package:homy/core/routes/routes.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/screens/plans/components/plan_component.dart';
import 'package:homy/utils/appbar_component.dart';
import 'package:homy/utils/text_component.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  void onPlanTap(String planType) {
    Navigator.pushNamed(context, Routes.buyPlanScreen,
        arguments: BuyPlanScreenArgs(planType: planType));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: scaffoldColor,
        appBar: screenAppBar(context, showProfile: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              screenText(textAssets[0], 22.0, FontWeight.w600, textDarkColor,
                  align: TextAlign.start),
              const SizedBox(height: 24.0),
              planComponentWidget(
                  height: height * 0.2,
                  width: width,
                  planType: "basic",
                  colors: const [Color(0xFFFF4B00), Color(0xFFFF4B00)],
                  title: "Homy Comfort",
                  description: textAssets[1],
                  onPlanTap: onPlanTap),
              const SizedBox(height: 32.0),
              planComponentWidget(
                  height: height * 0.2,
                  width: width,
                  planType: "standard",
                  colors: const [Color(0xFF423EFF), Color(0xFFFF4B00)],
                  title: "Homy Fusion",
                  description: textAssets[1],
                  onPlanTap: onPlanTap),
              const SizedBox(height: 32.0),
              planComponentWidget(
                  height: height * 0.2,
                  width: width,
                  planType: "pro",
                  colors: const [Color(0xFF1ED500), Color(0xFF423EFF)],
                  title: "Homy Wellness",
                  description: textAssets[1],
                  onPlanTap: onPlanTap),
            ],
          ),
        ));
  }

  final List<String> textAssets = [
    "Choose Your Perfect Culinary\nExperience",
    "Daily meals made easy with a North\nIndian touch. Quick, wholesome\nmeals for your family in just 1.5 hours.",
    "Service by Expert chefs, from North\nIndian to Continental, enjoy a\nvariety of cuisines with party\noptions included.",
    "Tailored to your dietary needs, this\npremium plan offers a holistic\nculinary experience with\npersonalized meals and exclusive\nevents."
  ];
}
