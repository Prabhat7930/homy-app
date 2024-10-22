import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/text_component.dart';

class DynamicGridSingleView extends StatefulWidget {
  final List<String> items;
  final String selectedItem;
  final Function(String item) toggleSelectedItem;
  final bool customPlan;

  const DynamicGridSingleView({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.toggleSelectedItem,
    required this.customPlan,
  });

  @override
  State<DynamicGridSingleView> createState() => _DynamicGridSingleViewState();
}

class _DynamicGridSingleViewState extends State<DynamicGridSingleView> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 8,
      children: widget.items.map((item) {
        return IntrinsicWidth(
          child: ChoiceChip(
            side: const BorderSide(color: textInputBgColor),
            padding: widget.customPlan == false
                ? const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0)
                : const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            label: widget.customPlan == false
                ? screenText(item, 14.0, FontWeight.w400, textDarkColor)
                : screenText(item, 16.0, FontWeight.w600, textDarkColor),
            selected: widget.selectedItem == item,
            onSelected: (_) {
              // print(widget.selectedItem);
              widget.toggleSelectedItem(item);
            },
            selectedColor: secondaryColor,
            backgroundColor: textInputBgColor,
            showCheckmark: false,
          ),
        );
      }).toList(),
    );
  }
}
