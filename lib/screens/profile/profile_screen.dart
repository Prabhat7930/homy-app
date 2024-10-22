import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/appbar_component.dart';
import 'package:homy/utils/button_component.dart';
import 'package:homy/utils/text_component.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool autopay = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: screenAppBar(context,
          showProfile: false, showText: true, text: "Profile"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  screenButton(() {}, "Diet Plan", secondaryColor, width * 0.3,
                      borderRadius: 12.0),
                  screenButton(
                      () {}, "My Meal Planner", secondaryColor, width * 0.4,
                      borderRadius: 12.0),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  screenText(
                      "Personal Details", 18, FontWeight.bold, textDarkColor),
                  InkWell(
                    onTap: () {},
                    child: screenText(
                        "Edit", 16, FontWeight.normal, secondaryColor,
                        underline: true),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildInfoRow("Name", "Prabhat"),
              const Divider(
                  height: 16.0, thickness: 2.0, color: textInputBgColor),
              _buildInfoRow("Email", "abc@gmail.com"),
              const Divider(
                  height: 16.0, thickness: 2.0, color: textInputBgColor),
              _buildInfoRow("Phone no.", "+91 123456789"),
              const Divider(
                  height: 16.0, thickness: 2.0, color: textInputBgColor),
              _buildInfoRow("Address", "Lorem lorem,Lorem lorem"),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {},
                child: _buildSettingsRow("Your plan details"),
              ),
              const Divider(
                  height: 16.0, thickness: 2.0, color: textInputBgColor),
              _buildSettingsRow("Autopay", isSwitch: true),
              const Divider(
                  height: 0.0, thickness: 2.0, color: textInputBgColor),
              InkWell(
                onTap: () {},
                child: _buildSettingsRow("Cancel Plan"),
              ),
              const Divider(
                  height: 16.0, thickness: 2.0, color: textInputBgColor),
              InkWell(
                onTap: () {},
                child: _buildSettingsRow("Give feedback"),
              ),
              const Divider(
                  height: 16.0, thickness: 2.0, color: textInputBgColor),
              InkWell(
                onTap: () {},
                child: _buildSettingsRow("Help & support"),
              ),
              const Divider(
                  height: 16.0, thickness: 2.0, color: textInputBgColor),
              InkWell(
                onTap: () {},
                child: _buildSettingsRow("About us"),
              ),
              const Divider(
                  height: 16.0, thickness: 2.0, color: textInputBgColor),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {},
                child:
                    screenText("Logout", 18, FontWeight.w600, secondaryColor),
              ),
              const SizedBox(height: 20.0)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          screenText(label, 16, FontWeight.normal, textDarkColor),
          screenText(value, 16, FontWeight.normal, textDarkColor),
        ],
      ),
    );
  }

  Widget _buildSettingsRow(String text, {bool isSwitch = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          screenText(text, 16, FontWeight.w600, textDarkColor),
          if (isSwitch)
            Switch(
              value: autopay,
              onChanged: (value) {
                setState(() {
                  autopay = value;
                });
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
      ),
    );
  }
}
