import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/text_component.dart';

PreferredSizeWidget screenAppBar(BuildContext context,
    {bool showProfile = false, bool showText = false, String text = ""}) {
  final width = MediaQuery.of(context).size.width;
  return PreferredSize(
    preferredSize: Size(width, 50.0),
    child: AppBar(
        toolbarHeight: kToolbarHeight * 1.1,
        scrolledUnderElevation: 0.0,
        backgroundColor: showText == false ? appBarColor : primaryColor,
        leadingWidth: showText == false ? 120.0 : 60.0,
        leading: showText == false
            ? Image.asset(
                height: 50.0,
                width: 91.0,
                fit: BoxFit.scaleDown,
                "assets/images/homy.png",
                scale: 3.0,
              )
            : InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 28.0,
                ),
              ),
        actions: [
          showProfile == true
              ? const Padding(
                  padding: EdgeInsets.only(right: 24.0),
                  child: Icon(
                    Icons.account_circle,
                    size: 32.0,
                    color: secondaryColor,
                  ),
                )
              : (showText == false
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: screenText(
                          text, 18.0, FontWeight.w600, textLightColor),
                    ))
        ],
        bottom: showText == false
            ? PreferredSize(
                preferredSize: Size(width * 0.8, 4.0),
                child: Container(
                  color: const Color(0xFFE3E3E3),
                  height: 1.0,
                  width: showProfile == true ? width : width * 0.9,
                ),
              )
            : const PreferredSize(
                preferredSize: Size(0.0, 0.0), child: SizedBox())),
  );
}
