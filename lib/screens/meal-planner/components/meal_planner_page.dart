import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/arrow_forward_icon_component.dart';
import 'package:homy/utils/text_component.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';

class MealPlannerPage extends StatefulWidget {
  const MealPlannerPage({super.key});

  @override
  State<MealPlannerPage> createState() => _MealPlannerPageState();
}

class _MealPlannerPageState extends State<MealPlannerPage> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            screenText("October 5", 22.0, FontWeight.w600, textDarkColor),
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
          minDate: DateTime(2023, 12, 31),
          maxDate: DateTime(2024, 1, 31),
          initialDate: DateTime(2024, 1, 15),
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
        const SizedBox(height: 20.0),
        screenText("Enter your breakfast preferences below", 14.0,
            FontWeight.w400, textDarkColor),
      ],
    );
  }
}
