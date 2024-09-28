import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/screens/user-details/components/grid_view_component.dart';
import 'package:homy/utils/text_component.dart';
import 'package:homy/utils/textfield_component.dart';

class DietPageTwoAndThree extends StatefulWidget {
  final String subHeadingText;
  final String selectionText;
  final String lastText;
  final List<String> items;
  final Set<String> selectedItems;
  final Function(String item, Set<String> selectedItems) toggleSelectedItem;
  final String userInputText;
  final TextEditingController userInputController;

  const DietPageTwoAndThree({
    super.key,
    required this.subHeadingText,
    required this.selectionText,
    required this.lastText,
    required this.items,
    required this.selectedItems,
    required this.toggleSelectedItem,
    required this.userInputText,
    required this.userInputController,
  });

  @override
  State<DietPageTwoAndThree> createState() => _DietPageTwoAndThreeState();
}

class _DietPageTwoAndThreeState extends State<DietPageTwoAndThree> {
  late String subHeadingText;
  late String selectionText;
  late String lastText;
  late List<String> items;
  late Set<String> selectedItems;
  late Function(String item, Set<String> selectedItems) toggleSelectedItem;
  late String userInputText;
  late TextEditingController userInputController;

  @override
  void initState() {
    super.initState();
    subHeadingText = widget.subHeadingText;
    selectionText = widget.selectionText;
    lastText = widget.lastText;
    items = widget.items;
    selectedItems = widget.selectedItems;
    toggleSelectedItem = widget.toggleSelectedItem;
    userInputText = widget.userInputText;
    userInputController = widget.userInputController;
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
          const SizedBox(height: 32.0),
          RichText(
            text: TextSpan(
                text: "Select your ",
                style: GoogleFonts.instrumentSans(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: textDarkColor,
                ),
                children: [
                  TextSpan(
                    text: "$selectionText ",
                    style: GoogleFonts.instrumentSans(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: secondaryColor,
                    ),
                  ),
                  TextSpan(
                    text: lastText,
                    style: GoogleFonts.instrumentSans(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: textDarkColor,
                    ),
                  )
                ]),
          ),
          const SizedBox(height: 12.0),
          DynamicGridView(
            items: items,
            selectedItems: selectedItems,
            toggleSelectedItem: toggleSelectedItem,
          ),
          const SizedBox(height: 40.0),
          screenText(userInputText, 14.0, FontWeight.w400, textDarkColor,
              align: TextAlign.start),
          const SizedBox(height: 8.0),
          screenInputField(
              userInputController, "Write ...", true, TextInputType.text,
              maxlines: 4, limitText: 200),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
