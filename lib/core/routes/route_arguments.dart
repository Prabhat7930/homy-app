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

class BillingDetailsScreenArgs {
  final String planType;
  final int baseAmount;
  final int extraPerson;
  final String morningMealTime;
  final String eveningMealTime;
  final String chefOffDay;
  final DateTime planStartDate;
  final String specialInstruction;
  final int couponDiscount;

  BillingDetailsScreenArgs({
    required this.planType,
    required this.baseAmount,
    required this.extraPerson,
    required this.morningMealTime,
    required this.eveningMealTime,
    required this.chefOffDay,
    required this.planStartDate,
    this.specialInstruction = "",
    this.couponDiscount = 0,
  });
}
