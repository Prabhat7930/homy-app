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
    Navigator.pushNamed(context, Routes.planDetailsScreen,
        arguments: PlanDetailsScreenArgs(planType: planType));
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                screenText(textAssets[0], 22.0, FontWeight.w600, textDarkColor,
                    align: TextAlign.start),
                const SizedBox(height: 24.0),
                planComponentWidget(
                    height: height * 0.5,
                    width: width,
                    imagePath: "assets/images/comfort2.png",
                    planType: "basic",
                    title: "Homy Comfort",
                    morningPrice: "8000",
                    eveningPrice: "7000",
                    description: textAssets[1],
                    onPlanTap: onPlanTap),
                const SizedBox(height: 32.0),
                planComponentWidget(
                    height: height * 0.5,
                    width: width,
                    imagePath: "assets/images/fusion.png",
                    planType: "standard",
                    title: "Homy Fusion",
                    morningPrice: "12000",
                    eveningPrice: "10000",
                    description: textAssets[2],
                    onPlanTap: onPlanTap),
                const SizedBox(height: 32.0),
                planComponentWidget(
                    height: height * 0.5,
                    width: width,
                    imagePath: "assets/images/wellness.png",
                    planType: "pro",
                    title: "Homy Wellness",
                    morningPrice: "21000",
                    eveningPrice: "18000",
                    description: textAssets[3],
                    onPlanTap: onPlanTap),
                const SizedBox(height: 20.0)
              ],
            ),
          ),
        ));
  }

  final List<String> textAssets = [
    "Pick your ideal dining Adventure!",
    "Daily meals made easy with a North\nIndian touch. Quick, wholesome meals for\nyour family in just 1.5 hours.",
    "Service by Expert chefs, from North\nIndian to Continental, enjoy a variety of\ncuisines with party options included.",
    "Tailored to your dietary needs, this\npremium plan offers a holistic culinary\nexperience with personalized meals and\nexclusive events."
  ];
}
