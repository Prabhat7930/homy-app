import 'package:flutter/material.dart';
import 'package:homy/core/routes/route_arguments.dart';
import 'package:homy/core/routes/routes.dart';
import 'package:homy/screens/auth/enter_phone_screen.dart';
import 'package:homy/screens/auth/otp_verification_screen.dart';
import 'package:homy/screens/community/community_screen.dart';
import 'package:homy/screens/health-score/health_score_screen.dart';
import 'package:homy/screens/meal-planner/meal_planner_screen.dart';
import 'package:homy/screens/my-meals/my_meals_screen.dart';
import 'package:homy/screens/notifications/notifications_screen.dart';
import 'package:homy/screens/onboarding/onboarding_screen.dart';
import 'package:homy/screens/onboarding/welcome_screen.dart';
import 'package:homy/screens/plans/plan_customization_screen.dart';
import 'package:homy/screens/plans/plan_detail_screen.dart';
import 'package:homy/screens/plans/plans_screen.dart';
import 'package:homy/screens/splash/splash_screen.dart';
import 'package:homy/screens/user-details/diet_plan_screen.dart';
import 'package:homy/screens/user-details/location_details_screen.dart';
import 'package:homy/screens/user-details/personal_details_screen.dart';
import 'package:homy/utils/navbar_host_component.dart';
import 'package:page_transition/page_transition.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    PageTransitionType transitionType = PageTransitionType.fade;
    Duration transitionDuration = const Duration(milliseconds: 200);

    Widget page;
    PageTransitionType type = transitionType;

    switch (settings.name) {
      // splash screen
      case Routes.splashScreen:
        page = const SplashScreen();
        break;
      case Routes.onBoardingScreen:
        page = const OnboardingScreen();
        break;
      case Routes.welcomeScreen:
        page = const WelcomeScreen();
        type = PageTransitionType.rightToLeft;
        break;
      case Routes.enterPhoneScreen:
        page = const EnterPhoneScreen();
        break;
      case Routes.otpVerificationScreen:
        final args = settings.arguments as OtpVerificationScreenArgs;
        page = OtpVerificationScreen(phoneNumber: args.phoneNumber);
        type = PageTransitionType.rightToLeft;
        break;
      case Routes.locationDetailScreen:
        page = const LocationDetailsScreen();
        break;
      case Routes.personalDetailScreen:
        page = const PersonalDetailsScreen();
        break;
      case Routes.dietPlanScreen:
        page = const DietPlanScreen();
        break;
      case Routes.healthScoreScreen:
        page = const HealthScoreScreen();
        break;
      case Routes.navHostScreen:
        final args = settings.arguments as NavHostScreenArgs;
        page = NavBarHost(currentIndex: args.currentIndex);
        break;
      case Routes.plansScreen:
        page = const PlansScreen();
        break;
      case Routes.notificationsScreen:
        page = const NotificationsScreen();
        break;
      case Routes.communityScreen:
        page = const CommunityScreen();
        break;
      case Routes.planDetailsScreen:
        final args = settings.arguments as PlanDetailsScreenArgs;
        page = PlanDetailsScreen(planType: args.planType);
        break;
      case Routes.planCustomizationScreen:
        final args = settings.arguments as PlanCustomizationScreenArgs;
        page = PlanCustomizationScreen(
          planType: args.planType,
          morningPrice: args.morningPrice,
          eveningPrice: args.eveningPrice,
        );
        break;
      case Routes.mealPlannerScreen:
        page = const MealPlannerScreen();
        break;
      case Routes.myMealsScreen:
        page = const MyMealsScreen();
        break;
      default:
        page = const Scaffold(
          body: Center(
            child: Text("No route  found!"),
          ),
        );
    }

    return PageTransition(
      child: page,
      type: type,
      duration: transitionDuration,
    );
  }
}
