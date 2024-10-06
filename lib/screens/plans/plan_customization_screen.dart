import 'package:flutter/material.dart';
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
  final TextEditingController couponController = TextEditingController();
  int pageCounter = 0;

  List<String> morningItems = [
    "6:00",
    "7:00",
    "8:00",
    "9:00",
    "10:00",
    "11:00"
  ];
  List<String> eveningItems = [
    "15:00",
    "16:00",
    "17:00",
    "18:00",
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
  List<String> dayItems = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];

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
                            couponController: couponController,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              screenButton(
                  onCheckoutButtonTap, "Checkout", secondaryColor, width * 0.85)
            ],
          ),
        ),
      ),
    );
  }

  final List<String> textAssets = [
    "Select from the available timings within the 6am to\n1pm slot.",
    "Select from the available timings within the 3pm to\n8pm slot."
  ];
}
