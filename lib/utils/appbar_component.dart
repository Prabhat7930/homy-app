import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';

PreferredSizeWidget screenAppBar(BuildContext context,
    {bool showProfile = false}) {
  final width = MediaQuery.of(context).size.width;
  return PreferredSize(
    preferredSize: Size(width, 50.0),
    child: AppBar(
        toolbarHeight: kToolbarHeight * 1.1,
        scrolledUnderElevation: 0.0,
        backgroundColor: appBarColor,
        leadingWidth: 150.0,
        leading: Image.asset(
          height: 50.0,
          width: 91.0,
          fit: BoxFit.scaleDown,
          "assets/images/homy.png",
          scale: 3.0,
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
              : const SizedBox()
        ],
        bottom: PreferredSize(
          preferredSize: Size(width * 0.8, 4.0),
          child: Container(
            color: const Color(0xFFE3E3E3),
            height: 1.0,
            width: showProfile == true ? width : width * 0.9,
          ),
        )),
  );
}
