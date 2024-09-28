import 'package:flutter/material.dart';
import 'package:homy/core/routes/routes.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/appbar_component.dart';
import 'package:homy/utils/button_component.dart';
import 'package:homy/utils/email_validator.dart';
import 'package:homy/utils/text_component.dart';
import 'package:homy/utils/textfield_component.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void onNextButtonTap() {
    if (firstNameController.text.length < 3) {
    } else if (lastNameController.text.length < 3) {
    } else if (!checkEmail(emailController.text)) {
    } else {
      Navigator.pushNamed(context, Routes.dietPlanScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: screenAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                screenText(
                    "Personal Details", 22.0, FontWeight.w600, textDarkColor),
                const SizedBox(height: 32.0),
                screenInputField(firstNameController, 'First name', true,
                    TextInputType.name),
                const SizedBox(height: 20.0),
                screenInputField(
                    lastNameController, 'Last name', true, TextInputType.name),
                const SizedBox(height: 20.0),
                screenInputField(
                    emailController, 'Email', true, TextInputType.emailAddress),
              ],
            ),
            screenButton(onNextButtonTap, "Next", secondaryColor, width * 0.85)
          ],
        ),
      ),
    );
  }
}
