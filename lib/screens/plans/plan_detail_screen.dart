import 'package:flutter/material.dart';
import 'package:homy/core/routes/route_arguments.dart';
import 'package:homy/core/routes/routes.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/screens/plans/components/plan_details_components.dart';
import 'package:homy/utils/appbar_component.dart';
import 'package:homy/utils/button_component.dart';
import 'package:homy/utils/floating_action_component.dart';
import 'package:homy/utils/text_component.dart';

class PlanDetailsScreen extends StatelessWidget {
  final String planType;
  const PlanDetailsScreen({super.key, required this.planType});

  Map<String, dynamic> _getPlanDetails() {
    switch (planType.toLowerCase()) {
      case 'basic':
        return {
          'title': 'Homy Comfort - Basic',
          'features': [
            {'icon': Icons.calendar_today_rounded, 'text': '4 month\nplan'},
            {
              'icon': Icons.access_time_filled,
              'text': 'Prepared within\n1.5 hours'
            },
            {'icon': Icons.restaurant_menu, 'text': 'North Indian\nmeals'},
            {'icon': Icons.groups_2_rounded, 'text': 'Serves upto 4\nmembers'},
          ],
          'pricing': [
            {
              'title': 'Morning Visit',
              'subtitle': '(8am - 1pm)',
              'price': '₹8,000'
            },
            {
              'title': 'Evening Visit',
              'subtitle': '(3pm - 8pm)',
              'price': '₹6,000'
            },
          ],
        };
      case 'standard':
        return {
          'title': 'Homy Fusion - Standard',
          'features': [
            {'icon': Icons.calendar_today_rounded, 'text': '4 month\nplan'},
            {
              'icon': Icons.access_time_filled,
              'text': 'Prepared within\n2.5 hours'
            },
            {'icon': Icons.groups_2_rounded, 'text': 'Serves upto 4\nmembers'},
            {'icon': Icons.restaurant_menu, 'text': 'Multi\ncuisines'},
          ],
          'pricing': [
            {
              'title': 'Morning Visit',
              'subtitle': '(8am - 1pm)',
              'price': '₹21,000'
            },
            {
              'title': 'Evening Visit',
              'subtitle': '(3pm - 8pm)',
              'price': '₹18,000'
            },
          ],
        };
      case 'pro':
        return {
          'title': 'Homy Wellness - Pro',
          'features': [
            {'icon': Icons.calendar_today, 'text': '4 month\nplan'},
            {
              'icon': Icons.access_time_filled,
              'text': 'Prepared within\n1.5 hours'
            },
            {'icon': Icons.restaurant_menu, 'text': 'Multi\ncuisines'},
            {'icon': Icons.groups_2_rounded, 'text': 'Serves upto 4\nmembers'},
            {
              'icon': Icons.celebration,
              'text': 'No. of Parties 3\nNo. of people 12'
            },
            {'icon': Icons.favorite, 'text': 'Special dietary\nneeds'},
          ],
          'pricing': [
            {
              'title': 'Morning Visit',
              'subtitle': '(8am - 1pm)',
              'price': '₹21,000'
            },
            {
              'title': 'Evening Visit',
              'subtitle': '(3pm - 8pm)',
              'price': '₹18,000'
            },
          ],
        };
      default:
        return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    final planDetails = _getPlanDetails();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    String planName = "";
    switch (planType) {
      case "basic":
        planName = "Homy Comfort";
        break;
      case "standard":
        planName = "Homy Standard";
        break;
      case "pro":
        planName = "Homy Wellness";
        break;
    }

    void onProceedButtonTap() {
      int morningPrice = 0;
      int eveningPrice = 0;

      switch (planType) {
        case "basic":
          morningPrice = 8000;
          eveningPrice = 6000;
          break;
        case "standard":
          morningPrice = 8000;
          eveningPrice = 6000;
          break;
        case "pro":
          morningPrice = 8000;
          eveningPrice = 6000;
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
          showProfile: false, showText: true, text: planName),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 40.0, bottom: 20.0, left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                screenText(
                    planDetails['title'], 24.0, FontWeight.bold, textDarkColor),
                const SizedBox(height: 24.0),
                buildFeatureGrid(planDetails['features']),
                planType == "standard"
                    ? Container(
                        height: height * 0.12,
                        width: width * 0.37,
                        margin: const EdgeInsets.only(top: 10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: secondaryColor, width: 1.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.celebration, color: textDarkColor),
                            const SizedBox(height: 8),
                            screenText(
                              "Special dietary\nneeds",
                              14.0,
                              FontWeight.w400,
                              textDarkColor,
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(height: 24.0),
                buildPricingSection(planDetails['pricing']),
                const SizedBox(height: 16.0),
                discountText(),
                const SizedBox(height: 16.0),
              ],
            ),
            Column(
              children: [
                noteText(),
                const SizedBox(height: 16.0),
                Center(
                  child: screenButton(
                    onProceedButtonTap,
                    'Proceed',
                    secondaryColor,
                    width * 0.85,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: screenFloatingButton(),
    );
  }
}
