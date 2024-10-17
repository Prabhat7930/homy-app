// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:homy/core/theme/color_theme.dart';
// import 'package:homy/utils/text_component.dart';

// Widget buildFeatureGrid(List<Map<String, dynamic>> features) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 28.0),
//     child: GridView.count(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       crossAxisCount: 2,
//       childAspectRatio: 3 / 2,
//       crossAxisSpacing: 10,
//       mainAxisSpacing: 10,
//       children: features
//           .map((feature) => Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: secondaryColor, width: 1.5),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(feature['icon'], color: textDarkColor),
//                     const SizedBox(height: 8),
//                     screenText(
//                       feature['text'],
//                       14.0,
//                       FontWeight.w400,
//                       textDarkColor,
//                     ),
//                   ],
//                 ),
//               ))
//           .toList(),
//     ),
//   );
// }

// Widget buildPricingSection(List<Map<String, dynamic>> pricing) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//     child: Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
//       child: Column(
//         children: pricing
//             .map((price) => Padding(
//                   padding:
//                       EdgeInsets.only(bottom: price == pricing.last ? 0 : 8),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           screenText(price['title'], 14.0, FontWeight.w600,
//                               textDarkColor,
//                               align: TextAlign.left),
//                           screenText(price['subtitle'], 12.0, FontWeight.w400,
//                               textDarkColor,
//                               align: TextAlign.left),
//                         ],
//                       ),
//                       screenText(
//                           price['price'], 16.0, FontWeight.bold, textDarkColor),
//                     ],
//                   ),
//                 ))
//             .toList(),
//       ),
//     ),
//   );
// }

// Widget discountText() {
//   return RichText(
//     text: TextSpan(
//         text: "An extra charge of ",
//         style: GoogleFonts.instrumentSans(
//           fontSize: 14.0,
//           fontWeight: FontWeight.w400,
//           color: textDarkColor,
//         ),
//         children: [
//           TextSpan(
//             text: "10% ",
//             style: GoogleFonts.instrumentSans(
//               fontSize: 14.0,
//               fontWeight: FontWeight.w400,
//               color: secondaryColor,
//             ),
//           ),
//           TextSpan(
//             text: "of the plan price\nper additional person.",
//             style: GoogleFonts.instrumentSans(
//               fontSize: 14.0,
//               fontWeight: FontWeight.w400,
//               color: textDarkColor,
//             ),
//           ),
//         ]),
//     textAlign: TextAlign.center,
//   );
// }

// Widget noteText() {
//   return RichText(
//     text: TextSpan(
//         text: "Note: ",
//         style: GoogleFonts.instrumentSans(
//           fontSize: 12.0,
//           fontWeight: FontWeight.bold,
//           color: textDarkColor,
//         ),
//         children: [
//           TextSpan(
//             text:
//                 "The plan will be renewed automatically, and you can\ncancel it before the last day of the upcoming month.",
//             style: GoogleFonts.instrumentSans(
//               fontSize: 12.0,
//               fontWeight: FontWeight.w400,
//               color: textDarkColor,
//             ),
//           ),
//         ]),
//     textAlign: TextAlign.center,
//   );
// }
