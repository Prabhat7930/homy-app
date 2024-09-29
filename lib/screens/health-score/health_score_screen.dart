import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homy/core/routes/routes.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/screens/health-score/components/health_plan_component.dart';
import 'package:homy/utils/appbar_component.dart';
import 'package:homy/utils/text_component.dart';
import 'dart:math' as math;

class HealthScoreScreen extends StatefulWidget {
  const HealthScoreScreen({super.key});

  @override
  State<HealthScoreScreen> createState() => _HealthScoreScreenState();
}

class _HealthScoreScreenState extends State<HealthScoreScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final bool showProgress = false;

  void onHomeButtonTap() {
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.navHostScreen, (route) => false);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: screenAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 20.0),
        child: showProgress == true
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  screenText("Generating Health Score", 22.0, FontWeight.w600,
                      textDarkColor),
                  SizedBox(height: height * 0.3),
                  Center(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (_, child) {
                        return CustomPaint(
                          size: const Size(120, 120),
                          painter: _CircularLoaderPainter(
                            animation: _controller,
                            color: secondaryColor,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Your Health Score is ",
                          style: GoogleFonts.instrumentSans(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              color: textDarkColor),
                          children: [
                        TextSpan(
                          text: "25",
                          style: GoogleFonts.instrumentSans(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              color: secondaryColor),
                        )
                      ])),
                  screenText(
                      screenTextAsset[0], 14.0, FontWeight.w400, textDarkColor,
                      align: TextAlign.start),
                  const SizedBox(height: 40.0),
                  healthScoreContainer(height * 0.35, width * 0.9,
                      screenTextAsset, onHomeButtonTap, () {}),
                ],
              ),
      ),
    );
  }

  final screenTextAsset = [
    "We've calculated your health score to recommend\na personalized diet plan based on your needs.",
    "Needs Attention and significant dietary\nadjustments.",
    "We've selected the Homy Wellness for you,\ndesigned to accommodate your health\nconditions and support your well-being."
  ];
}

class _CircularLoaderPainter extends CustomPainter {
  _CircularLoaderPainter({
    required this.animation,
    required this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color.withOpacity(0.3)
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);

    paint.color = color;

    double progress = (animation.value) * 2 * math.pi;

    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2),
      -math.pi / 2,
      progress,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_CircularLoaderPainter oldDelegate) => true;
}
