import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/appbar_component.dart';

class BuyPlanScreen extends StatelessWidget {
  final String planType;
  const BuyPlanScreen({super.key, required this.planType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: screenAppBar(context, showProfile: false, showPlans: true),
      body: Center(child: Text(planType)),
    );
  }
}
