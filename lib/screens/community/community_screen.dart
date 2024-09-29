import 'package:flutter/material.dart';
import 'package:homy/utils/appbar_component.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screenAppBar(context, showProfile: true),
      body: const Center(
        child: Text("Community Screen"),
      ),
    );
  }
}
