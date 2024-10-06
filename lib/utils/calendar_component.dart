import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/text_component.dart';

class CalendarOption extends StatefulWidget {
  final IconData icon;
  final Function(DateTime) onDateSelected;
  final bool showIcon;
  final bool showCalender;
  const CalendarOption({
    super.key,
    required this.icon,
    required this.onDateSelected,
    this.showIcon = true,
    this.showCalender = true,
  });

  @override
  State<CalendarOption> createState() => _CalendarOptionState();
}

class _CalendarOptionState extends State<CalendarOption> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.showCalender) {
          datePicker();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: textInputBgColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              screenText(
                  "${getMonthName(selectedDate.month)} ${selectedDate.day} ${selectedDate.year}",
                  14.0,
                  FontWeight.w400,
                  textDarkColor),
              const SizedBox(
                height: 28.0,
                width: 28.0,
                child: Padding(
                    padding: EdgeInsetsDirectional.all(4.0),
                    child: Icon(
                      Icons.edit_calendar_rounded,
                      size: 24.0,
                      color: secondaryColor,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  Future<void> datePicker() async {
    final currentYear = DateTime.now().year;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(currentYear + 1),
      selectableDayPredicate: (DateTime date) {
        return date.isAfter(DateTime.now().subtract(const Duration(days: 1)));
      },
    );

    if (picked != null && picked != selectedDate) {
      widget.onDateSelected(picked);
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
