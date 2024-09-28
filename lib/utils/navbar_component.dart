import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homy/core/theme/color_theme.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: primaryColor,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: secondaryColor,
      unselectedItemColor: Colors.white,
      selectedLabelStyle: GoogleFonts.instrumentSans(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
      ),
      unselectedLabelStyle: GoogleFonts.instrumentSans(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
      ),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fact_check_rounded),
          label: 'Plans',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.groups),
          label: 'Community',
        ),
      ],
    );
  }
}
