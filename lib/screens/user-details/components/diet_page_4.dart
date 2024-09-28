import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/text_component.dart';
import 'package:homy/utils/textfield_component.dart';

class DietPageFour extends StatefulWidget {
  final String subHeadingText;
  final TextEditingController healthCondController;
  final bool diabetes;
  final bool highBloodPressure;
  final bool thyroidIssues;
  final bool lactoseIntolerance;
  final bool celiacDisease;
  final void Function(String key, bool value) onToggle;

  const DietPageFour({
    super.key,
    required this.subHeadingText,
    required this.healthCondController,
    required this.diabetes,
    required this.highBloodPressure,
    required this.thyroidIssues,
    required this.lactoseIntolerance,
    required this.celiacDisease,
    required this.onToggle,
  });

  @override
  State createState() => _DietPageFourState();
}

class _DietPageFourState extends State<DietPageFour> {
  late String subHeadingText;
  late TextEditingController healthCondController;
  late void Function(String key, bool value) onToggle;

  @override
  void initState() {
    super.initState();
    subHeadingText = widget.subHeadingText;
    healthCondController = widget.healthCondController;
    onToggle = widget.onToggle;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          screenText(subHeadingText, 14.0, FontWeight.w400, textDarkColor),
          const SizedBox(height: 40.0),
          _buildSwitch("Diabetes", widget.diabetes, onToggle),
          _buildSwitch(
              "High Blood Pressure", widget.highBloodPressure, onToggle),
          _buildSwitch("Thyroid Issues", widget.thyroidIssues, onToggle),
          _buildSwitch(
              "Lactose Intolerance", widget.lactoseIntolerance, onToggle),
          _buildSwitch("Celiac Disease", widget.celiacDisease, onToggle),
          const SizedBox(height: 40.0),
          screenText("Other", 14.0, FontWeight.w400, textDarkColor),
          const SizedBox(height: 8.0),
          screenInputField(
              healthCondController, "Write ...", true, TextInputType.text,
              maxlines: 4, limitText: 200),
        ],
      ),
    );
  }

  Widget _buildSwitch(
      String title, bool value, Function(String, bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        screenText(title, 14.0, FontWeight.w400, textDarkColor),
        Switch(
          value: value,
          onChanged: (value) {
            onChanged(title, value);
          },
          inactiveThumbColor: Colors.white,
          activeColor: Colors.white,
          inactiveTrackColor: const Color(0xFFE6E8EA),
          activeTrackColor: secondaryColor,
          trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          trackOutlineWidth: WidgetStateProperty.all(0),
          thumbColor: WidgetStateProperty.resolveWith((state) {
            return Colors.white;
          }),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ],
    );
  }
}
