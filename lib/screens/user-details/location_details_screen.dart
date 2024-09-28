import 'package:flutter/material.dart';
import 'package:homy/core/routes/routes.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/appbar_component.dart';
import 'package:homy/utils/button_component.dart';
import 'package:homy/utils/text_component.dart';
import 'package:homy/utils/textfield_component.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationDetailsScreen extends StatefulWidget {
  const LocationDetailsScreen({super.key});

  @override
  State<LocationDetailsScreen> createState() => _LocationDetailsScreenState();
}

class _LocationDetailsScreenState extends State<LocationDetailsScreen> {
  bool? locationPermission;

  TextEditingController pincodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController localityController = TextEditingController();
  TextEditingController flatnoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    handleLocationPermission();
  }

  void handleLocationPermission() async {
    var status = await Permission.locationWhenInUse.request();

    if (status.isDenied || status.isPermanentlyDenied) {
      setState(() {
        locationPermission = false;
      });
    } else if (status.isGranted) {
      setState(() {
        locationPermission = true;
      });

      Navigator.pushNamedAndRemoveUntil(
          context, Routes.personalDetailScreen, (route) => false);
    }
  }

  void onNextButtonTap() {
    if (pincodeController.text.length < 6) {
    } else if (cityController.text.length < 3) {
    } else if (areaController.text.isEmpty) {
    } else if (localityController.text.isEmpty) {
    } else if (flatnoController.text.isEmpty) {
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.personalDetailScreen, (route) => false);
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
        child: locationPermission == null
            ? Center(child: CircularProgressIndicator())
            : locationPermission == false
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          screenText("Location Details", 22.0, FontWeight.w600,
                              textDarkColor),
                          const SizedBox(height: 32.0),
                          screenInputField(pincodeController, 'Pincode', false,
                              TextInputType.number,
                              limitDigit: 6),
                          const SizedBox(height: 20.0),
                          screenInputField(
                              cityController, 'City', true, TextInputType.text,
                              limitText: 20),
                          const SizedBox(height: 20.0),
                          screenInputField(areaController, 'Area/Sector', true,
                              TextInputType.text,
                              limitText: 20),
                          const SizedBox(height: 20.0),
                          screenInputField(localityController, 'Locality', true,
                              TextInputType.text,
                              limitText: 30),
                          const SizedBox(height: 20.0),
                          screenInputField(
                              flatnoController,
                              'House no./flat/floor/building',
                              true,
                              TextInputType.text,
                              limitText: 20),
                        ],
                      ),
                      screenButton(onNextButtonTap, "Next", secondaryColor,
                          width * 0.85),
                    ],
                  )
                : const SizedBox(),
      ),
    );
  }
}
