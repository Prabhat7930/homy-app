import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/screens/my-meals/components/breakfast_tab.dart';
import 'package:homy/screens/my-meals/components/dinner_tab.dart';
import 'package:homy/screens/my-meals/components/lunch_tab.dart';
import 'package:homy/utils/appbar_component.dart';

class MyMealsScreen extends StatefulWidget {
  const MyMealsScreen({super.key});

  @override
  State<MyMealsScreen> createState() => _MyMealsScreenState();
}

class _MyMealsScreenState extends State<MyMealsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Temporary data for each tab
    final List<Map<String, String>> breakfastMeals = [
      {'date': '25\nSept', 'meal': 'Poha with lots of peanuts and tea'},
      {'date': '24\nSept', 'meal': 'Oats, coffee and banana'},
      {'date': '23\nSept', 'meal': 'Boiled eggs, banana shake and toast'},
    ];

    final List<Map<String, String>> lunchMeals = [
      {'date': '25\nSept', 'meal': 'Rice, dal, and mixed vegetable curry'},
      {'date': '24\nSept', 'meal': 'Chicken sandwich with salad'},
      {'date': '23\nSept', 'meal': 'Vegetable pulao with raita'},
    ];

    final List<Map<String, String>> dinnerMeals = [
      {'date': '25\nSept', 'meal': 'Grilled fish with steamed vegetables'},
      {'date': '24\nSept', 'meal': 'Paneer tikka with naan bread'},
      {'date': '23\nSept', 'meal': 'Vegetable soup with garlic bread'},
    ];

    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: screenAppBar(context,
          showProfile: false, showText: true, text: "My Meals"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              color: scaffoldColor,
              child: TabBar(
                controller: _tabController,
                labelColor: textDarkColor,
                unselectedLabelColor: Colors.grey,
                indicatorWeight: 1.0,
                indicatorColor: secondaryColor,
                dividerColor: Colors.transparent,
                labelStyle: GoogleFonts.instrumentSans(
                  fontSize: 18.0,
                  color: textDarkColor,
                ),
                tabs: const [
                  Tab(text: 'Breakfast'),
                  Tab(text: 'Lunch'),
                  Tab(text: 'Dinner'),
                ],
              ),
            ),
            const SizedBox(height: 28.0),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  BreakfastTab(meals: breakfastMeals),
                  LunchTab(meals: lunchMeals),
                  DinnerTab(meals: dinnerMeals),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
