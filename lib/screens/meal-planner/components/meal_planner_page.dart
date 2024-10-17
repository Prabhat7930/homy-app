import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/arrow_forward_icon_component.dart';
import 'package:homy/utils/dropdown_component.dart';
import 'package:homy/utils/icon_button_component.dart';
import 'package:homy/utils/text_component.dart';
import 'package:homy/utils/textfield_component.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:intl/intl.dart';

class MealPlannerPage extends StatefulWidget {
  final double width;
  final List<String> foodTimings;
  final String? selectedFoodTiming;
  final void Function(String?) onFoodTimingChange;
  final TextEditingController preferencesController;
  final VoidCallback onTapAddButton;

  const MealPlannerPage({
    super.key,
    required this.width,
    required this.foodTimings,
    required this.selectedFoodTiming,
    required this.onFoodTimingChange,
    required this.preferencesController,
    required this.onTapAddButton,
  });

  @override
  State<MealPlannerPage> createState() => _MealPlannerPageState();
}

class _MealPlannerPageState extends State<MealPlannerPage> {
  late double width;
  late List<String> foodTimings;
  late void Function(String?) onFoodTimingChange;
  late TextEditingController preferencesController;
  late VoidCallback onTapAddButton;

  DateTime selectedDate = DateTime.now();

  DateTime calculateMinDate() {
    return DateTime(selectedDate.year, selectedDate.month - 1, 1);
  }

  DateTime calculateMaxDate() {
    return DateTime(selectedDate.year, selectedDate.month + 2, 0);
  }

  @override
  void initState() {
    super.initState();
    width = widget.width;
    foodTimings = widget.foodTimings;
    onFoodTimingChange = widget.onFoodTimingChange;
    preferencesController = widget.preferencesController;
    onTapAddButton = widget.onTapAddButton;
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('MMMM d').format(selectedDate);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              screenText(formattedDate, 22.0, FontWeight.w600, textDarkColor),
              iconContainer(
                Icons.calendar_today_rounded,
                containerColor: secondaryColor,
                height: 32.0,
                width: 32.0,
                iconSize: 20.0,
                iconColor: Colors.white,
              )
            ],
          ),
          const SizedBox(height: 32.0),
          HorizontalWeekCalendar(
            minDate: calculateMinDate(),
            maxDate: calculateMaxDate(),
            initialDate: selectedDate,
            onDateChange: (date) {
              setState(() {
                selectedDate = date;
              });
            },
            showTopNavbar: false,
            monthFormat: "MMMM yyyy",
            showNavigationButtons: true,
            weekStartFrom: WeekStartFrom.Sunday,
            borderRadius: BorderRadius.circular(24.0),
            activeBackgroundColor: primaryColor,
            activeTextColor: Colors.white,
            inactiveBackgroundColor: scaffoldColor,
            inactiveTextColor: const Color(0xFFA4A4A4),
            disabledTextColor: Colors.grey,
            disabledBackgroundColor: Colors.grey.withOpacity(.3),
            activeNavigatorColor: Colors.deepPurple,
            inactiveNavigatorColor: Colors.grey,
            monthColor: Colors.deepPurple,
          ),
          const SizedBox(height: 20.0),
          screenText(
              "Select the meal type", 14.0, FontWeight.w400, textDarkColor),
          const SizedBox(height: 8.0),
          SizedBox(
              height: 58.0,
              width: 160.0,
              child: dropdownInput(foodTimings, widget.selectedFoodTiming,
                  onFoodTimingChange, "Breakfast")),
          const SizedBox(height: 20.0),
          screenText(
              "Enter your ${widget.selectedFoodTiming?.toLowerCase()} preferences below",
              14.0,
              FontWeight.w400,
              textDarkColor),
          const SizedBox(height: 8.0),
          SizedBox(
              width: width,
              child: screenInputField(preferencesController, "Tap here...",
                  true, TextInputType.text,
                  limitText: 200, maxlines: 4)),
          const SizedBox(height: 20.0),
          screenIconButton(
            onTapAddButton,
            "Add",
            Colors.white,
            width * 0.25,
            iconContainer(
              Icons.add_rounded,
              containerColor: secondaryColor,
              width: 16.0,
              height: 16.0,
              iconSize: 12.0,
              iconColor: Colors.white,
            ),
            borderRadius: 12.0,
            textColor: textDarkColor,
            height: 40.0,
          ),
          const SizedBox(height: 20.0)
        ],
      ),
    );
  }
}
