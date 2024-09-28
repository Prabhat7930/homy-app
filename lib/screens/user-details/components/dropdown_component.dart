import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/text_component.dart';

Widget dropdownInput(List<String> items, String? selectedValue,
    ValueChanged<String?> onChanged) {
  return DropdownButtonHideUnderline(
    child: DropdownButton2<String>(
      isExpanded: true,
      hint: screenText("Gender", 14.0, FontWeight.w400, Colors.grey),
      items: items
          .map((String item) => DropdownMenuItem<String>(
              value: item,
              child: screenText(item, 14.0, FontWeight.w400, textDarkColor)))
          .toList(),
      value: selectedValue,
      onChanged: onChanged,
      buttonStyleData: const ButtonStyleData(
          width: 40,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              color: textInputBgColor)),
      iconStyleData: const IconStyleData(
          icon: Icon(
        Icons.arrow_drop_down_rounded,
        size: 32.0,
        color: secondaryColor,
      )),
      dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0))),
      menuItemStyleData: const MenuItemStyleData(
        height: 40,
      ),
    ),
  );
}
