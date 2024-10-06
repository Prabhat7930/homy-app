import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/screens/meal-planner/components/buy_plan_page.dart';
import 'package:homy/screens/meal-planner/components/meal_planner_page.dart';
import 'package:homy/utils/appbar_component.dart';

class MealPlannerScreen extends StatefulWidget {
  const MealPlannerScreen({super.key});

  @override
  State<MealPlannerScreen> createState() => _MealPlannerScreenState();
}

class _MealPlannerScreenState extends State<MealPlannerScreen> {
  bool planBought = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: screenAppBar(context,
          showProfile: false, showText: true, text: "Meal Planner"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
        child:
            planBought == false ? const BuyPlanPage() : const MealPlannerPage(),
      ),
    );
  }
}
