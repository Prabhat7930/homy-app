import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homy/core/routes/route_arguments.dart';
import 'package:homy/core/routes/routes.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/button_component.dart';
import 'package:homy/utils/text_component.dart';
import 'package:homy/utils/textfield_component.dart';

class EnterPhoneScreen extends StatefulWidget {
  const EnterPhoneScreen({super.key});

  @override
  State<EnterPhoneScreen> createState() => _EnterPhoneScreenState();
}

class _EnterPhoneScreenState extends State<EnterPhoneScreen> {
  TextEditingController phoneController = TextEditingController();
  String countryCode = "+91";

  void onVerifyButtonTap() {
    if (phoneController.text.length == 10) {
      Navigator.pushNamed(
        context,
        Routes.otpVerificationScreen,
        arguments: OtpVerificationScreenArgs(
          phoneNumber: phoneController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // background image
          Image.asset(
            height: height,
            width: width,
            "assets/images/salad2.png",
            fit: BoxFit.cover,
          ),

          // black translucent cover
          Container(
            height: height,
            width: width,
            color: imageCover,
          ),

          // info container
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.45,
              width: width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                color: scaffoldColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 12.0),
                  Image.asset(
                    "assets/images/homy.png",
                    scale: 3.0,
                  ),
                  const SizedBox(height: 8.0),
                  screenText(
                      textAssets[0], 22.0, FontWeight.w700, textDarkColor),
                  const SizedBox(height: 4.0),
                  screenText(
                      textAssets[1], 14.0, FontWeight.w400, textDarkColor),
                  const SizedBox(height: 24.0),

                  // country picker and phone field
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // country code picker
                      InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            countryFilter: <String>['IN'],
                            showPhoneCode: true,
                            onSelect: (Country country) {
                              setState(() {
                                countryCode = country.countryCode;
                              });
                            },
                            moveAlongWithKeyboard: true,
                            countryListTheme: CountryListThemeData(
                              padding: const EdgeInsets.only(top: 20.0),
                              bottomSheetHeight: height * 0.70,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                              inputDecoration: InputDecoration(
                                labelText: 'Search',
                                hintText: 'Start typing to search',
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xFF8C98A8)
                                        .withOpacity(0.2),
                                  ),
                                ),
                              ),
                              searchTextStyle: GoogleFonts.instrumentSans(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: textDarkColor,
                              ),
                            ),
                          );
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                              color: textInputBgColor,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                screenText(countryCode, 16.0, FontWeight.w400,
                                    textDarkColor),
                                const SizedBox(width: 4.0),
                                Image.asset(
                                  "assets/icons/arrow_drop.png",
                                  scale: 3.0,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      // phone field
                      const SizedBox(width: 12.0),
                      SizedBox(
                        height: 50.0,
                        width: width * 0.6,
                        child: screenInputField(
                          phoneController,
                          '12345 67890',
                          false,
                          TextInputType.number,
                        ),
                      )
                    ],
                  ),

                  // verify button
                  const SizedBox(height: 40.0),
                  screenButton(onVerifyButtonTap, "Verify", secondaryColor,
                      width * 0.85),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  final textAssets = const [
    "Enter Phone Number",
    "We’ll send you a verification code to keep your\naccount secure"
  ];
}
