import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/screens/user-details/components/dropdown_component.dart';
import 'package:homy/utils/text_component.dart';
import 'package:homy/utils/textfield_component.dart';
import 'package:radio_group_v2/utils/radio_group_decoration.dart';
import 'package:radio_group_v2/widgets/view_models/radio_group_controller.dart';
import 'package:radio_group_v2/widgets/views/radio_group.dart';

class DietPageOne extends StatefulWidget {
  final String subHeadingText;
  final TextEditingController ageController;
  final List<String> genderItems;
  final String? selectedGender;
  final void Function(String? value) onGenderChange;
  final TextEditingController weightController;
  final TextEditingController heightController;
  final String questionText;
  final String choiceText;
  final TextEditingController mealController;
  final RadioGroupController activityController;
  final int activityChoice;
  final Function(dynamic) updateChoice;

  const DietPageOne({
    super.key,
    required this.subHeadingText,
    required this.ageController,
    required this.genderItems,
    required this.selectedGender,
    required this.onGenderChange,
    required this.weightController,
    required this.heightController,
    required this.questionText,
    required this.choiceText,
    required this.mealController,
    required this.activityController,
    required this.activityChoice,
    required this.updateChoice,
  });

  @override
  State<DietPageOne> createState() => _DietPageOneState();
}

class _DietPageOneState extends State<DietPageOne> {
  late String subHeadingText;
  late TextEditingController ageController;
  late List<String> genderItems;
  late String? selectedGender;
  late void Function(String? value) onGenderChange;
  late TextEditingController weightController;
  late TextEditingController heightController;
  late String questionText;
  late String choiceText;
  late TextEditingController mealController;
  late RadioGroupController activityController;
  late Function(dynamic) updateChoice;

  @override
  void initState() {
    subHeadingText = widget.subHeadingText;
    ageController = widget.ageController;
    genderItems = widget.genderItems;
    onGenderChange = widget.onGenderChange;
    weightController = widget.weightController;
    heightController = widget.heightController;
    questionText = widget.questionText;
    choiceText = widget.choiceText;
    mealController = widget.mealController;
    activityController = widget.activityController;
    updateChoice = widget.updateChoice;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          screenText(subHeadingText, 14.0, FontWeight.w400, textDarkColor,
              align: TextAlign.start),
          const SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 160.0,
                  child: screenInputField(
                      ageController, "Age", false, TextInputType.number,
                      limitDigit: 3)),
              SizedBox(
                  height: 58.0,
                  width: 160.0,
                  child: dropdownInput(genderItems, widget.selectedGender,
                      onGenderChange, "Gender")),
            ],
          ),
          const SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 160.0,
                child: screenInputField(weightController, "Weight (in Kgs)",
                    false, TextInputType.number,
                    limitDigit: 3),
              ),
              SizedBox(
                width: 160.0,
                child: screenInputField(heightController, "Height (in Cms)",
                    false, TextInputType.number,
                    limitDigit: 3),
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          screenText(questionText, 14.0, FontWeight.w400, textDarkColor,
              align: TextAlign.start),
          const SizedBox(height: 12.0),
          SizedBox(
              width: 160.0,
              child: screenInputField(
                  mealController, "0", false, TextInputType.number,
                  limitDigit: 1)),
          const SizedBox(height: 24.0),
          screenText(choiceText, 14.0, FontWeight.w400, textDarkColor,
              align: TextAlign.start),
          const SizedBox(height: 12.0),
          RadioGroup(
            controller: activityController,
            values: const [
              "Sedentary",
              "Lightly Active",
              "Active",
              "Very Active"
            ],
            indexOfDefault: widget.activityChoice,
            orientation: RadioGroupOrientation.vertical,
            decoration: RadioGroupDecoration(
              spacing: 0,
              labelStyle: GoogleFonts.instrumentSans(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: textDarkColor,
              ),
              activeColor: secondaryColor,
            ),
            onChanged: updateChoice,
          ),
          const SizedBox(height: 20.0)
        ],
      ),
    );
  }
}
