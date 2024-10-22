import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homy/core/routes/route_arguments.dart';
import 'package:homy/core/routes/routes.dart';
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

  List<String> morningTimings = [
    "7:30",
    "8:00",
    "9:00",
    "10:00",
    "11:00",
    "12:00",
  ];
  List<String> eveningTimings = [
    "5:00",
    "6:00",
    "7:00",
    "8:00",
    "9:00",
    "10:00",
  ];

  String selectedMorningTiming = "8:00";
  String selectedEveningTiming = "8:00";

  void toggleSelectedMorningTiming(String timing) {
    setState(() {
      selectedMorningTiming = timing;
    });
  }

  void toggleSelectedEveningTiming(String timing) {
    setState(() {
      selectedEveningTiming = timing;
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

  void onCheckoutButtonTap() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );

    if (pageCounter == 1) {
      String plan = "";
      switch (planType) {
        case "basic":
          plan = "Homy Comfort";
          break;
        case "standard":
          plan = "Homy Fusion";
          break;
        case "pro":
          plan = "Homy Wellness";
          break;
      }

      int people = 0;
      if (peopleController.text != "" && peopleController.text != "null") {
        people = int.parse(peopleController.text) - 4;
      }

      Navigator.pushNamed(
        context,
        Routes.billingScreen,
        arguments: BillingDetailsScreenArgs(
          planType: plan,
          baseAmount: morningPrice + eveningPrice,
          extraPerson: people,
          morningMealTime: selectedMorningTiming,
          eveningMealTime: selectedEveningTiming,
          chefOffDay: selectedDay.toString(),
          specialInstruction: specialInstructionController.text,
          planStartDate: selectedDate,
          couponDiscount: 0,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    planType = widget.planType;
    morningPrice = widget.morningPrice;
    eveningPrice = widget.eveningPrice;
  }

  @override
  void dispose() {
    pageController.dispose();
    peopleController.dispose();
    specialInstructionController.dispose();
    couponController.dispose();
    super.dispose();
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
                            morningTimings: morningTimings,
                            selectedMorningTiming: selectedMorningTiming,
                            eveningTimings: eveningTimings,
                            selectedEveningTiming: selectedEveningTiming,
                            toggleSelectedMorningTiming:
                                toggleSelectedMorningTiming,
                            toggleSelectedEveningTiming:
                                toggleSelectedEveningTiming,
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

  final List<String> textAssets = const [
    "What time would you like your morning (am) meal\nto be ready?",
    "What time would you like your evening (pm) meal\nto be ready?",
    "Your meals will be prepared within 15 minutes\nbefore or after the scheduled time.",
    "The plan will begin within 5 days of booking."
  ];
}
