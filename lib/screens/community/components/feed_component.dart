import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/utils/text_component.dart';

Widget postWidget(Map<String, dynamic> feedData) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 12.0),
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.0),
      // Updated boxShadow to provide a smooth elevation effect
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3), // Softer shadow color
          spreadRadius: 2.0, // Small spread to ensure the shadow spreads evenly
          blurRadius: 6.0, // Higher blur for smoother edges
          offset: const Offset(0, 4), // Vertical shadow offset for elevation
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(feedData['avatarImage']),
              radius: 24,
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  screenText(
                      feedData['name'], 14.0, FontWeight.w500, textDarkColor),
                  screenText(feedData['description'], 12.0, FontWeight.w400,
                      const Color(0xFF777777))
                ],
              ),
            ),
            Column(
              children: [
                const Icon(
                  Icons.favorite,
                  color: Colors.grey,
                ),
                const SizedBox(width: 4),
                screenText(
                    feedData['likes'], 10.0, FontWeight.w400, textDarkColor),
              ],
            )
          ],
        ),
        const SizedBox(height: 12.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            feedData['postImage'],
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8.0),
        screenText(
            feedData['postDescription'], 14.0, FontWeight.w400, textDarkColor,
            align: TextAlign.start)
      ],
    ),
  );
}
