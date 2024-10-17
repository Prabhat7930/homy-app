import 'package:flutter/material.dart';
import 'package:homy/core/routes/routes.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/screens/meal-planner/components/buy_plan_page.dart';
import 'package:homy/screens/meal-planner/components/meal_planner_page.dart';
import 'package:homy/utils/appbar_component.dart';
import 'package:homy/utils/floating_action_component.dart';
import 'package:homy/utils/text_component.dart';

class MealPlannerScreen extends StatefulWidget {
  const MealPlannerScreen({super.key});

  @override
  State<MealPlannerScreen> createState() => _MealPlannerScreenState();
}

class _MealPlannerScreenState extends State<MealPlannerScreen> {
  TextEditingController preferencesController = TextEditingController();

  String? selectedFoodTiming = "Breakfast";
  List<String> foodTimings = ["Breakfast", "Lunch", "Dinner"];

  void onFoodTimingChange(String? timing) {
    setState(() {
      selectedFoodTiming = timing;
    });
  }

  void onTapAddButton() {}

  void onTapMyMealButton() {
    Navigator.pushNamed(context, Routes.myMealsScreen);
  }

  bool planBought = true;

  @override
  void dispose() {
    preferencesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: scaffoldColor,
      appBar: screenAppBar(context,
          showProfile: false, showText: true, text: "Meal Planner"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
        child: planBought == false
            ? const BuyPlanPage()
            : MealPlannerPage(
                width: width,
                foodTimings: foodTimings,
                selectedFoodTiming: selectedFoodTiming,
                onFoodTimingChange: onFoodTimingChange,
                preferencesController: preferencesController,
                onTapAddButton: onTapAddButton,
              ),
      ),
      floatingActionButton: planBought == true
          ? InkWell(
              onTap: onTapMyMealButton,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                height: height * 0.12,
                width: width * 0.18,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    color: secondaryColor),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.rice_bowl_rounded,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    const SizedBox(height: 4.0),
                    screenText(
                        "My\nMeals", 14.0, FontWeight.w400, textLightColor,
                        wordHeight: 1.0)
                  ],
                ),
              ),
            )
          : screenFloatingButton(),
    );
  }
}
