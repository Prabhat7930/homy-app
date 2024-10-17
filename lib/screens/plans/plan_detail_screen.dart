import 'package:flutter/material.dart';
import 'package:homy/core/routes/route_arguments.dart';
import 'package:homy/core/routes/routes.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/appbar_component.dart';
import 'package:homy/utils/text_component.dart';
import 'package:homy/utils/button_component.dart';

class PlanDetailsScreen extends StatelessWidget {
  final String planType;

  const PlanDetailsScreen({super.key, required this.planType});

  @override
  Widget build(BuildContext context) {
    final planDetails = _getPlanDetails();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final ScrollController scrollController =
        ScrollController(keepScrollOffset: false);

    void onBuyPlanButtonTap() {
      int morningPrice = 0;
      int eveningPrice = 0;

      switch (planType.toLowerCase()) {
        case "basic":
          morningPrice = 8000;
          eveningPrice = 7000;
          break;
        case "standard":
          morningPrice = 12000;
          eveningPrice = 10000;
          break;
        case "pro":
          morningPrice = 21000;
          eveningPrice = 18000;
          break;
        default:
      }

      Navigator.pushNamed(context, Routes.planCustomizationScreen,
          arguments: PlanCustomizationScreenArgs(
            planType: planType,
            morningPrice: morningPrice,
            eveningPrice: eveningPrice,
          ));
    }

    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: screenAppBar(context,
          showProfile: false, showText: true, text: planDetails['title']),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.75,
              child: Scrollbar(
                controller: scrollController,
                thumbVisibility: true,
                radius: const Radius.circular(12.0),
                thickness: 1.0,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoSection(
                          'Service duration',
                          planDetails['serviceDuration'],
                          planDetails['serviceDurationDescription']),
                      _buildInfoSection(
                          'Meal prep time', planDetails['mealPrepTime'], ""),
                      _buildInfoSection(
                          'Expertise', planDetails['expertise'], ""),
                      _buildInfoSection(
                          'Dishes', "per visit", planDetails['dishes']),
                      if (planDetails.containsKey('partyPackage'))
                        _buildInfoSection(
                            'Party package',
                            planDetails['partyCount'],
                            planDetails['partyPackage']),
                      _buildInfoSection('Pricing options', "1 month",
                          planDetails['pricingOptions']),
                      _buildInfoSection('Chef', planDetails['chefType'], ""),
                      if (planDetails.containsKey('dietitianConsultation'))
                        _buildInfoSection(
                            'Dietitian Consultation',
                            "Nutrition Plan",
                            planDetails['dietitianConsultation']),
                      if (planDetails.containsKey('dietPlan'))
                        _buildInfoSection(
                            'Diet plan', planDetails['dietPlan'], ""),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
            screenButton(
              onBuyPlanButtonTap,
              'Buy ${planDetails['title']}',
              secondaryColor,
              width * 0.85,
            ),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> _getPlanDetails() {
    switch (planType.toLowerCase()) {
      case 'basic':
        return {
          'title': 'Homy Comfort',
          'serviceDuration': '1 month',
          'serviceDurationDescription':
              '1 day off per week (customizable)\n26 days of service',
          'mealPrepTime': '1.5 hours per visit',
          'expertise': 'North Indian Cuisine',
          'dishes': '3 dishes + 1 type of bread\nServes up to 4 people',
          'pricingOptions':
              'Morning Visit: ₹8000 (adjustable)\nEvening Visit: ₹7000 (adjustable)\nBoth Visits: Includes both morning and evening visits',
          'chefType': 'Professional Chef',
        };
      case 'standard':
        return {
          'title': 'Homy Fusion',
          'serviceDuration': '1 month',
          'serviceDurationDescription':
              '1 day off per week (customizable)\n26 days of service',
          'mealPrepTime': '2.5 hours per visit',
          'expertise':
              'North Indian, South Indian, Chinese, Continental, Italian',
          'dishes': '3 dishes + 1 type of bread\nServes up to 4 people',
          'partyCount': '2 parties',
          'partyPackage':
              'Serves: 10 people\nIncludes 4 items\n₹250 per extra item\n(desserts, sides, main courses)\n₹100 per extra guest',
          'pricingOptions':
              'Morning Visit: ₹12000 (adjustable)\nEvening Visit: ₹10000 (adjustable)\nBoth Visits: Includes both morning and evening visits',
          'chefType': 'Professional Chef',
        };
      case 'pro':
        return {
          'title': 'Homy Wellness',
          'serviceDuration': '1 month',
          'serviceDurationDescription':
              '1 day off per week (customizable)\n26 days of service',
          'mealPrepTime': '2.5 hours per visit',
          'expertise':
              'North Indian, South Indian, Chinese, Continental, Italian, Turkish, Lebanese, and more',
          'dishes': '6 dishes + 2 types of bread\nServes up to 4 people',
          'partyCount': '3 parties',
          'partyPackage':
              'Serves: 15 people\nIncludes 4 items\n₹250 per extra item\n(desserts, sides, main courses)\n₹120 per extra guest',
          'pricingOptions':
              'Morning Visit: ₹21000 (adjustable)\nEvening Visit: ₹18000 (adjustable)\nBoth Visits: Includes both morning and evening visits',
          'chefType': 'Professional Chef',
          'dietitianConsultation':
              'Meals are prepared according to your dietary needs, guided by our dietitian\nThe dietitian will customize your meal plan based on your health requirements and personal preferences',
          'dietPlan': 'Tailored to your wellness goals',
        };
      default:
        return {};
    }
  }

  Widget _buildInfoSection(String title, String subtitle, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        screenText(title, 17, FontWeight.bold, textDarkColor,
            align: TextAlign.start),
        screenText(subtitle, 14, FontWeight.w600, secondaryColor,
            align: TextAlign.start),
        const SizedBox(height: 4),
        content != ""
            ? screenText(content, 14, FontWeight.w400, textDarkColor,
                align: TextAlign.start)
            : const SizedBox(),
        const SizedBox(height: 16),
      ],
    );
  }
}
