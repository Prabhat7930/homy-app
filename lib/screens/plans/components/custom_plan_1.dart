import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/grid_view_component.dart';
import 'package:homy/utils/text_component.dart';
import 'package:homy/utils/textfield_component.dart';

class PlanCustomizationPageOne extends StatefulWidget {
  final List<String> textAssets;
  final TextEditingController peopleController;
  final List<String> morningItems;
  final Set<String> selectedMorningItems;
  final List<String> eveningItems;
  final Set<String> selectedEveningItems;
  final Function(String item, Set<String> selectedItems) toggleSelectedItem;
  const PlanCustomizationPageOne({
    super.key,
    required this.textAssets,
    required this.peopleController,
    required this.morningItems,
    required this.selectedMorningItems,
    required this.eveningItems,
    required this.selectedEveningItems,
    required this.toggleSelectedItem,
  });

  @override
  State<PlanCustomizationPageOne> createState() =>
      _PlanCustomizationPageOneState();
}

class _PlanCustomizationPageOneState extends State<PlanCustomizationPageOne> {
  late List<String> textAssets;
  late TextEditingController peopleController;
  late List<String> morningItems;
  late Set<String> selectedMorningItems;
  late List<String> eveningItems;
  late Set<String> selectedEveningItems;
  late Function(String item, Set<String> selectedItems) toggleSelectedItem;

  @override
  void initState() {
    super.initState();
    textAssets = widget.textAssets;
    peopleController = widget.peopleController;
    morningItems = widget.morningItems;
    selectedMorningItems = widget.selectedMorningItems;
    eveningItems = widget.eveningItems;
    selectedEveningItems = widget.selectedEveningItems;
    toggleSelectedItem = widget.toggleSelectedItem;
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
          DynamicGridView(
            items: morningItems,
            selectedItems: selectedMorningItems,
            toggleSelectedItem: toggleSelectedItem,
            customPlan: true,
          ),
          const SizedBox(height: 24.0),
          screenText(textAssets[1], 14.0, FontWeight.w400, textDarkColor,
              align: TextAlign.start),
          const SizedBox(height: 16.0),
          DynamicGridView(
            items: eveningItems,
            selectedItems: selectedEveningItems,
            toggleSelectedItem: toggleSelectedItem,
            customPlan: true,
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
