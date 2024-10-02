import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/text_component.dart';

class DynamicGridView extends StatefulWidget {
  final List<String> items;
  final Set<String> selectedItems;
  final Function(String item, Set<String> selectedItems) toggleSelectedItem;
  final bool customPlan;

  const DynamicGridView({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.toggleSelectedItem,
    required this.customPlan,
  });

  @override
  State<DynamicGridView> createState() => _DynamicGridViewState();
}

class _DynamicGridViewState extends State<DynamicGridView> {
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
            selected: widget.selectedItems.contains(item),
            onSelected: (_) =>
                widget.toggleSelectedItem(item, widget.selectedItems),
            selectedColor: secondaryColor,
            backgroundColor: textInputBgColor,
            showCheckmark: false,
          ),
        );
      }).toList(),
    );
  }
}
