import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/screens/user-details/components/dropdown_component.dart';
import 'package:homy/utils/calendar_component.dart';
import 'package:homy/utils/text_component.dart';
import 'package:homy/utils/textfield_component.dart';

class PlanCustomizationPageTwo extends StatefulWidget {
  final List<String> textAssets;
  final List<String> dayItems;
  final String? selectedDay;
  final void Function(String? value) onDayChange;
  final void Function(DateTime newDate) onDateSelected;
  final TextEditingController couponController;

  const PlanCustomizationPageTwo({
    super.key,
    required this.textAssets,
    required this.dayItems,
    required this.selectedDay,
    required this.onDayChange,
    required this.onDateSelected,
    required this.couponController,
  });

  @override
  State<PlanCustomizationPageTwo> createState() =>
      _PlanCustomizationPageTwoState();
}

class _PlanCustomizationPageTwoState extends State<PlanCustomizationPageTwo> {
  late List<String> textAssets;
  late List<String> dayItems;
  late void Function(String? value) onDayChange;
  late void Function(DateTime newDate) onDateSelected;
  late TextEditingController couponController;

  @override
  void initState() {
    super.initState();
    textAssets = widget.textAssets;
    dayItems = widget.dayItems;
    onDayChange = widget.onDayChange;
    onDateSelected = widget.onDateSelected;
    couponController = widget.couponController;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          screenText("Select a day for chef's day off", 14.0, FontWeight.w400,
              textDarkColor),
          const SizedBox(height: 12.0),
          SizedBox(
              height: 58.0,
              width: 160.0,
              child: dropdownInput(
                  dayItems, widget.selectedDay, onDayChange, "Sunday")),
          const SizedBox(height: 16.0),
          screenText("Select start date of the plan", 14.0, FontWeight.w400,
              textDarkColor,
              align: TextAlign.start),
          noteText(),
          const SizedBox(height: 16.0),
          SizedBox(
            height: 58.0,
            width: 160.0,
            child: CalendarOption(
                icon: Icons.calendar_month, onDateSelected: onDateSelected),
          ),
          const SizedBox(height: 24.0),
          screenText("Coupon code", 14.0, FontWeight.w400, textDarkColor,
              align: TextAlign.start),
          const SizedBox(height: 12.0),
          Container(
            width: 180.0,
            height: 58.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: textInputBgColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120.0,
                  child: screenInputField(
                      couponController, "Enter code", true, TextInputType.text,
                      limitText: 10),
                ),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    width: 60.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: textInputBgColor),
                    child: screenText(
                        "Apply", 14.0, FontWeight.w500, secondaryColor),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget noteText() {
    return RichText(
      text: TextSpan(
          text: "Note: ",
          style: GoogleFonts.instrumentSans(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: textDarkColor,
          ),
          children: [
            TextSpan(
              text: "The plan will start 3 days after the booking\ndate.",
              style: GoogleFonts.instrumentSans(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: textDarkColor,
              ),
            ),
          ]),
      textAlign: TextAlign.start,
    );
  }
}
