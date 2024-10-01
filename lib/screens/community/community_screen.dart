import 'package:flutter/material.dart';
import 'package:homy/core/theme/color_theme.dart';
import 'package:homy/screens/community/components/feed_component.dart';
import 'package:homy/utils/appbar_component.dart';
import 'package:homy/utils/text_component.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  List<Map<String, dynamic>> feedData = [
    {
      "avatarImage":
          "https://images.pexels.com/photos/27603834/pexels-photo-27603834/free-photo-of-ao-dai.jpeg",
      "name": "Amit Tiwari",
      "description": "The Cook",
      "likes": "222",
      "postImage":
          "https://images.pexels.com/photos/28039616/pexels-photo-28039616/free-photo-of-a-bowl-of-tomatoes-on-a-table.jpeg",
      "postDescription":
          "Fresh, vibrant, and packed with goodness – the perfect salad bowl!",
    },
    {
      "avatarImage":
          "https://images.pexels.com/photos/27603834/pexels-photo-27603834/free-photo-of-ao-dai.jpeg",
      "name": "Amit Tiwari",
      "description": "The Cook",
      "likes": "222",
      "postImage":
          "https://images.pexels.com/photos/28039616/pexels-photo-28039616/free-photo-of-a-bowl-of-tomatoes-on-a-table.jpeg",
      "postDescription":
          "Fresh, vibrant, and packed with goodness – the perfect salad bowl!",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldColor,
        appBar: screenAppBar(context, showProfile: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              screenText("Daily Bites", 22.0, FontWeight.w600, textDarkColor),
              Expanded(
                child: ListView.builder(
                  itemCount: feedData.length,
                  itemBuilder: (context, index) {
                    final post = feedData[index];
                    print(post);
                    return postWidget(post);
                  },
                ),
              )
            ],
          ),
        ));
  }
}
