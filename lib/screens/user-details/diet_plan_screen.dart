import 'package:flutter/material.dart';
import 'package:homy/core/routes/routes.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/screens/user-details/components/diet_page_1.dart';
import 'package:homy/screens/user-details/components/diet_page_2_3.dart';
import 'package:homy/screens/user-details/components/diet_page_4.dart';
import 'package:homy/utils/appbar_component.dart';
import 'package:homy/utils/button_component.dart';
import 'package:homy/utils/text_component.dart';
import 'package:radio_group_v2/widgets/view_models/radio_group_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DietPlanScreen extends StatefulWidget {
  const DietPlanScreen({super.key});

  @override
  State<DietPlanScreen> createState() => _DietPlanScreenState();
}

class _DietPlanScreenState extends State<DietPlanScreen> {
  final PageController pageController = PageController();

  // Text Controllers
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController mealController = TextEditingController();
  RadioGroupController activityController = RadioGroupController();
  TextEditingController dietPrefsController = TextEditingController();
  TextEditingController fitnessGoalsController = TextEditingController();
  TextEditingController healthCondController = TextEditingController();
  int pageCounter = 0;

  // user data
  int activityChoice = 0;
  String? selectedGender;
  final Set<String> selectedDietaryPrefsItems = {};
  final Set<String> selectedFitnessGoalsItems = {};

  bool diabetes = false;
  bool highBloodPressure = false;
  bool thyroidIssues = false;
  bool lactoseIntolerance = false;
  bool celiacDisease = false;

  // methods for states

  // user - gender
  void onGenderChange(String? gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  // choice of lifestyle
  void updateChoice(choice) {
    switch (choice) {
      case "Sedentary":
        setState(() {
          activityChoice = 0;
        });
        break;
      case "Lightly Active":
        setState(() {
          activityChoice = 1;
        });
        break;
      case "Active":
        setState(() {
          activityChoice = 2;
        });
        break;
      case "Very Active":
        setState(() {
          activityChoice = 3;
        });
        break;
    }
  }

  // health condition
  void toggleHealthCondition(String key, bool value) {
    switch (key) {
      case "Diabetes":
        setState(() {
          diabetes = value;
        });
        break;
      case "High Blood Pressure":
        setState(() {
          highBloodPressure = value;
        });
        break;
      case "Thyroid Issues":
        setState(() {
          thyroidIssues = value;
        });
        break;
      case "Lactose Intolerance":
        setState(() {
          lactoseIntolerance = value;
        });
        break;
      case "Celiac Disease":
        setState(() {
          celiacDisease = value;
        });
        break;
    }
  }

  // diet and fitness goals
  void toggleSelectedItem(String item, Set<String> selectedItems) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  void onNextButtonTap() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );

    if (pageCounter == 3) {
      routeToHealthScorePage();
    }
  }

  void routeToHealthScorePage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("userDetails", true);

    Navigator.pushNamedAndRemoveUntil(
        context, Routes.healthScoreScreen, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        if (pageController.page != 0) {
          pageController.previousPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
          return false;
        }
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: scaffoldColor,
        appBar: screenAppBar(context),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    screenText("Personalized Diet Plan", 22.0, FontWeight.w600,
                        textDarkColor),
                    Expanded(
                      child: PageView(
                        controller: pageController,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (index) {
                          setState(() {
                            pageCounter = index;
                          });
                        },
                        children: [
                          DietPageOne(
                            subHeadingText: textAssets[0],
                            ageController: ageController,
                            genderItems: genderItems,
                            selectedGender: selectedGender,
                            onGenderChange: onGenderChange,
                            weightController: weightController,
                            heightController: heightController,
                            questionText: textAssets[1],
                            choiceText: textAssets[2],
                            mealController: mealController,
                            activityController: activityController,
                            activityChoice: activityChoice,
                            updateChoice: updateChoice,
                          ),
                          DietPageTwoAndThree(
                            subHeadingText: textAssets[3],
                            selectionText: textAssets[4],
                            lastText: textAssets[5],
                            items: dietaryPreferences,
                            selectedItems: selectedDietaryPrefsItems,
                            toggleSelectedItem: toggleSelectedItem,
                            userInputText: textAssets[6],
                            userInputController: dietPrefsController,
                          ),
                          DietPageTwoAndThree(
                            subHeadingText: textAssets[7],
                            selectionText: textAssets[8],
                            lastText: textAssets[9],
                            items: fitnessGoals,
                            selectedItems: selectedFitnessGoalsItems,
                            toggleSelectedItem: toggleSelectedItem,
                            userInputText: textAssets[10],
                            userInputController: fitnessGoalsController,
                          ),
                          DietPageFour(
                            subHeadingText: textAssets[11],
                            diabetes: diabetes,
                            highBloodPressure: highBloodPressure,
                            thyroidIssues: thyroidIssues,
                            lactoseIntolerance: lactoseIntolerance,
                            celiacDisease: celiacDisease,
                            onToggle: toggleHealthCondition,
                            healthCondController: healthCondController,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              screenButton(
                  onNextButtonTap, "Next", secondaryColor, width * 0.85)
            ],
          ),
        ),
      ),
    );
  }

  final List<String> genderItems = ['Male', 'Female', 'Others'];

  final List<String> dietaryPreferences = [
    'Vegetarian',
    'Vegan',
    'Keto',
    'Low fat',
    'Low carb',
    'Sugar free',
    'Non-vegetarian',
    'Gluten-free'
  ];

  final List<String> fitnessGoals = [
    'Weight loss',
    'Muscle gain',
    'Low fat',
    'Control diabetes',
    'Manage blood sugar',
    'Postpartum Recovery',
    'Gluten-free',
    'Lean-muscle',
    'Boost immunity'
  ];

  final textAssets = [
    "Tell us a bit about you, and we’ll create a custom\nmeal plan tailored to your needs.",
    "Meal frequency-how many meals do you have per\nday?",
    "Choose your activity level",
    "Now, let’s know all about your diet.",
    "dietary",
    "preferences",
    "or write down your own dietary preference in less\nthan 50 words.",
    "Tell us about your fitness goals.",
    "fitness",
    "goals",
    "or write down your own goals in less\nthan 50 words.",
    "Select any health conditions that apply to you."
  ];
}
