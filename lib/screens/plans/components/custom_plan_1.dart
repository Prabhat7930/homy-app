import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/grid_view_single_component.dart';
import 'package:homy/utils/text_component.dart';
import 'package:homy/utils/textfield_component.dart';

class PlanCustomizationPageOne extends StatefulWidget {
  final List<String> textAssets;
  final TextEditingController peopleController;
  final List<String> morningTimings;
  final String selectedMorningTiming;
  final List<String> eveningTimings;
  final String selectedEveningTiming;
  final Function(String timing) toggleSelectedMorningTiming;
  final Function(String timing) toggleSelectedEveningTiming;
  const PlanCustomizationPageOne({
    super.key,
    required this.textAssets,
    required this.peopleController,
    required this.morningTimings,
    required this.selectedMorningTiming,
    required this.eveningTimings,
    required this.selectedEveningTiming,
    required this.toggleSelectedMorningTiming,
    required this.toggleSelectedEveningTiming,
  });

  @override
  State<PlanCustomizationPageOne> createState() =>
      _PlanCustomizationPageOneState();
}

class _PlanCustomizationPageOneState extends State<PlanCustomizationPageOne> {
  late List<String> textAssets;
  late TextEditingController peopleController;
  late List<String> morningTimings;
  late List<String> eveningTimings;
  late Function(String timing) toggleSelectedMorningTiming;
  late Function(String timing) toggleSelectedEveningTiming;

  @override
  void initState() {
    super.initState();
    textAssets = widget.textAssets;
    peopleController = widget.peopleController;
    morningTimings = widget.morningTimings;
    eveningTimings = widget.eveningTimings;
    toggleSelectedMorningTiming = widget.toggleSelectedMorningTiming;
    toggleSelectedEveningTiming = widget.toggleSelectedEveningTiming;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          screenText(
              "Total number of people", 14.0, FontWeight.w400, textDarkColor),
          const SizedBox(height: 12.0),
          SizedBox(
              width: 100.0,
              child: screenInputField(
                  peopleController, "4", false, TextInputType.number,
                  limitDigit: 1)),
          const SizedBox(height: 16.0),
          screenText(textAssets[0], 14.0, FontWeight.w400, textDarkColor,
              align: TextAlign.start),
          const SizedBox(height: 16.0),
          DynamicGridSingleView(
            items: morningTimings,
            selectedItem: widget.selectedMorningTiming,
            toggleSelectedItem: toggleSelectedMorningTiming,
            customPlan: true,
          ),
          const SizedBox(height: 24.0),
          screenText(textAssets[1], 14.0, FontWeight.w400, textDarkColor,
              align: TextAlign.start),
          const SizedBox(height: 16.0),
          DynamicGridSingleView(
            items: eveningTimings,
            selectedItem: widget.selectedEveningTiming,
            toggleSelectedItem: toggleSelectedEveningTiming,
            customPlan: true,
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
