import 'package:flutter/material.dart';
import 'package:homy/core/routes/routes.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/screens/auth/components/auth_components.dart';
import 'package:homy/utils/appbar_component.dart';
import 'package:homy/utils/button_component.dart';
import 'package:homy/utils/text_component.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  const OtpVerificationScreen({super.key, required this.phoneNumber});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController otpController = TextEditingController();
  late String phoneNumber;

  void saveUserState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("userLoggedIn", true);
    await prefs.setBool("userDetails", false);
  }

  void onEnterButtonTap() {
    if (otpController.text.length == 6) {
      saveUserState();
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.locationDetailScreen, (route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    phoneNumber = widget.phoneNumber;
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
                screenText(textAssets[0], 22.0, FontWeight.w600, textDarkColor),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    screenText("${textAssets[1]}$phoneNumber", 14.0,
                        FontWeight.w400, textDarkColor),
                    const SizedBox(width: 4.0),
                    const Icon(
                      Icons.edit,
                      color: Colors.black,
                      size: 18,
                    )
                  ],
                ),
                const SizedBox(height: 40.0),
                buildPinput(otpController),
                const SizedBox(height: 32.0),
                authButton(() {}, "Resend OTP", Colors.black, width)
              ],
            ),
            screenButton(
                onEnterButtonTap, "Enter", secondaryColor, width * 0.85),
          ],
        ),
      ),
    );
  }

  final textAssets = ["OTP Verification", "Enter the OTP sent on +91 "];
}
