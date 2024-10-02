class OtpVerificationScreenArgs {
  final String phoneNumber;

  OtpVerificationScreenArgs({required this.phoneNumber});
}

class NavHostScreenArgs {
  int currentIndex;
  NavHostScreenArgs({required this.currentIndex});
}

class PlanDetailsScreenArgs {
  final String planType;

  PlanDetailsScreenArgs({required this.planType});
}

class PlanCustomizationScreenArgs {
  final String planType;
  final int morningPrice;
  final int eveningPrice;

  PlanCustomizationScreenArgs({
    required this.planType,
    required this.morningPrice,
    required this.eveningPrice,
  });
}
