import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/screens/community/community_screen.dart';
import 'package:homy/screens/home/home_screen.dart';
import 'package:homy/screens/notifications/notifications_screen.dart';
import 'package:homy/screens/plans/plans_screen.dart';

class NavBarHost extends StatefulWidget {
  final int currentIndex;
  const NavBarHost({super.key, required this.currentIndex});

  @override
  State<NavBarHost> createState() => _NavBarHostState();
}

class _NavBarHostState extends State<NavBarHost> {
  late int currentIndex;

  List<Widget> body = const [
    HomeScreen(),
    PlansScreen(),
    NotificationsScreen(),
    CommunityScreen()
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
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
      ),
    );
  }
}
