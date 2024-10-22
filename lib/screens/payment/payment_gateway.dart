import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/appbar_component.dart';
import 'package:homy/utils/text_component.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:slidable_button/slidable_button.dart';
import 'package:slider_button/slider_button.dart';

class BillingDetailsScreen extends StatefulWidget {
  final String planType;
  final int baseAmount;
  final int extraPerson;
  final String morningMealTime;
  final String eveningMealTime;
  final String chefOffDay;
  final DateTime planStartDate;
  final String specialInstruction;
  final int couponDiscount;

  const BillingDetailsScreen({
    required this.planType,
    required this.baseAmount,
    required this.extraPerson,
    required this.morningMealTime,
    required this.eveningMealTime,
    required this.chefOffDay,
    required this.planStartDate,
    this.specialInstruction = "",
    this.couponDiscount = 0,
    super.key,
  });

  @override
  State<BillingDetailsScreen> createState() => _BillingDetailsScreenState();
}

class _BillingDetailsScreenState extends State<BillingDetailsScreen> {
  late Razorpay _razorpay;
  String razorPaymentID = "";
  String razorOrderID = "";
  String razorSignature = "";
  int buttonPosition = 0;

  @override
  void initState() {
    super.initState();
    initPricing();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentFailure);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  late int baseAmount;
  late double extraCharge;
  void initPricing() {
    baseAmount = widget.baseAmount;
    extraCharge = widget.baseAmount * 0.1 * widget.extraPerson;
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void openRazorpayCheckout(int amount, String? orderID) {
    var options = {
      "key": dotenv.env["RAZORPAY_LIVE"],
      "amount": widget.baseAmount * 100,
      "name": "Homy",
      "prefill": {"contact": "", "email": "homy@gmail.com"},
      "order_id": orderID,
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint("Problem opening razorpay : $e");
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) async {
    razorPaymentID = response.paymentId.toString();
    razorOrderID = response.orderId.toString();
    razorSignature = response.signature.toString();
  }

  void handlePaymentFailure(PaymentFailureResponse response) {}

  void handleExternalWallet(ExternalWalletResponse response) {
    debugPrint("To the External wallet : ${response.walletName}");
  }

  @override
  Widget build(BuildContext context) {
    final double totalAmount = baseAmount + extraCharge - widget.couponDiscount;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: screenAppBar(
        context,
        showProfile: false,
        showText: true,
        text: widget.planType,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                screenText(
                  "Checkout",
                  22.0,
                  FontWeight.w600,
                  textDarkColor,
                  align: TextAlign.left,
                ),
                const SizedBox(height: 24.0),
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        screenText(
                          'Billing details',
                          18.0,
                          FontWeight.w600,
                          textDarkColor,
                          align: TextAlign.left,
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            screenText("Base price", 14, FontWeight.normal,
                                textDarkColor,
                                align: TextAlign.left),
                            screenText(
                              '₹$baseAmount.00',
                              14.0,
                              FontWeight.w600,
                              textDarkColor,
                              align: TextAlign.right,
                            ),
                          ],
                        ),
                        const Divider(height: 8.0),
                        const SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            screenText(
                              'Extra people charge (${widget.extraPerson})',
                              14.0,
                              FontWeight.normal,
                              textDarkColor,
                              align: TextAlign.left,
                            ),
                            screenText(
                              '₹${extraCharge}0',
                              14.0,
                              FontWeight.w600,
                              textDarkColor,
                              align: TextAlign.right,
                            ),
                          ],
                        ),
                        const Divider(height: 8.0),
                        const SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            screenText(
                              'Coupon discount',
                              14.0,
                              FontWeight.normal,
                              textDarkColor,
                              align: TextAlign.left,
                            ),
                            screenText(
                              '-₹${widget.couponDiscount}.00',
                              14.0,
                              FontWeight.w600,
                              textDarkColor,
                              align: TextAlign.right,
                            ),
                          ],
                        ),
                        const Divider(height: 24.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            screenText(
                              'Total Amount',
                              16.0,
                              FontWeight.w600,
                              textDarkColor,
                              align: TextAlign.left,
                            ),
                            screenText(
                              '₹${totalAmount}0',
                              16.0,
                              FontWeight.w600,
                              secondaryColor,
                              align: TextAlign.right,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                screenText(
                    'Cancellation Policy:', 16, FontWeight.w600, secondaryColor,
                    align: TextAlign.left),
                const SizedBox(height: 8),
                screenText(textAssets[0], 14, FontWeight.w500, textDarkColor,
                    align: TextAlign.left),
                const SizedBox(height: 4),
                screenText(textAssets[1], 14, FontWeight.w500, textDarkColor,
                    align: TextAlign.left),
              ],
            ),
            HorizontalSlidableButton(
              height: 50.0,
              width: width * 0.85,
              buttonWidth: 50.0,
              color: secondaryColor,
              buttonColor: Colors.white,
              tristate: true,
              dismissible: false,
              label: buttonPosition == 0
                  ? const Icon(
                      Icons.keyboard_double_arrow_right_rounded,
                      size: 28.0,
                      color: secondaryColor,
                    )
                  : const Icon(
                      Icons.check_rounded,
                      size: 28.0,
                      color: secondaryColor,
                    ),
              child: Center(
                child: screenText(
                    "Pay ₹$totalAmount", 16.0, FontWeight.w600, textLightColor),
              ),
              onChanged: (position) {
                setState(() {
                  if (position == SlidableButtonPosition.end) {
                    buttonPosition = 2;
                  } else if (position == SlidableButtonPosition.sliding) {
                    buttonPosition = 1;
                  } else {
                    buttonPosition = 0;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  final textAssets = const [
    "  • 40% cancellation fee, if cook is assigned.",
    "  • Full refund if you cancel the plan within 2 days."
  ];
}
