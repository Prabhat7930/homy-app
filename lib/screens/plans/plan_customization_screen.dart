import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/screens/plans/components/custom_plan_1.dart';
import 'package:homy/screens/plans/components/custom_plan_2.dart';
import 'package:homy/utils/appbar_component.dart';
import 'package:homy/utils/button_component.dart';
import 'package:homy/utils/text_component.dart';

class PlanCustomizationScreen extends StatefulWidget {
  final String planType;
  final int morningPrice;
  final int eveningPrice;
  const PlanCustomizationScreen({
    super.key,
    required this.planType,
    required this.morningPrice,
    required this.eveningPrice,
  });

  @override
  State<PlanCustomizationScreen> createState() =>
      _PlanCustomizationScreenState();
}

class _PlanCustomizationScreenState extends State<PlanCustomizationScreen> {
  final PageController pageController = PageController();
  final TextEditingController peopleController = TextEditingController();
  final TextEditingController specialInstructionController =
      TextEditingController();
  final TextEditingController couponController = TextEditingController();
  int pageCounter = 0;

  List<String> morningItems = [
    "7:30",
    "8:00",
    "9:00",
    "10:00",
    "11:00",
    "12:00",
  ];
  List<String> eveningItems = [
    "5:00",
    "6:00",
    "7:00",
    "8:00",
    "9:00",
    "10:00",
  ];

  Set<String> selectedMorningItems = {};
  Set<String> selectedEveningItems = {};

  void toggleSelectedItem(String item, Set<String> selectedItems) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  String? selectedDay = "Sunday";
  List<String> dayItems = ["Saturday", "Sunday", "Monday"];

  void onDayChange(String? day) {
    setState(() {
      selectedDay = day;
    });
  }

  DateTime selectedDate = DateTime.now();
  void onDateSelected(DateTime newDate) {
    setState(() {
      selectedDate = newDate;
    });
  }

  late String planType;
  late int morningPrice;
  late int eveningPrice;

  @override
  void initState() {
    super.initState();
    planType = widget.planType;
    morningPrice = widget.morningPrice;
    eveningPrice = widget.eveningPrice;
  }

  void onCheckoutButtonTap() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );

    if (pageCounter == 1) {}
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
        appBar: screenAppBar(context,
            showProfile: false, showText: true, text: "Customize"),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    screenText("Personalize Your Plan", 22.0, FontWeight.w600,
                        textDarkColor),
                    const SizedBox(height: 24.0),
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
                          PlanCustomizationPageOne(
                            textAssets: textAssets,
                            peopleController: peopleController,
                            morningItems: morningItems,
                            selectedMorningItems: selectedMorningItems,
                            eveningItems: eveningItems,
                            selectedEveningItems: selectedEveningItems,
                            toggleSelectedItem: toggleSelectedItem,
                          ),
                          PlanCustomizationPageTwo(
                            textAssets: textAssets,
                            dayItems: dayItems,
                            selectedDay: selectedDay,
                            onDayChange: onDayChange,
                            onDateSelected: onDateSelected,
                            specialInstructionController:
                                specialInstructionController,
                            couponController: couponController,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              pageCounter == 0
                  ? noteText(textAssets[2])
                  : noteText(textAssets[3]),
              const SizedBox(height: 8.0),
              screenButton(
                  onCheckoutButtonTap, "Checkout", secondaryColor, width * 0.85)
            ],
          ),
        ),
      ),
    );
  }

  Widget noteText(String text) {
    return RichText(
      text: TextSpan(
          text: "Note: ",
          style: GoogleFonts.instrumentSans(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: secondaryColor,
          ),
          children: [
            TextSpan(
              text: text,
              style: GoogleFonts.instrumentSans(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: textDarkColor,
              ),
            ),
          ]),
      textAlign: TextAlign.center,
    );
  }

  final List<String> textAssets = [
    "What time would you like your morning (am) meal\nto be ready?",
    "What time would you like your morning (pm) meal\nto be ready?",
    "Your meals will be prepared within 15 minutes\nbefore or after the scheduled time.",
    "The plan will begin within 5 days of booking."
  ];
}
