import 'package:flutter/material.dart';
import 'package:homy/utils/appbar_component.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screenAppBar(context, showProfile: true),
      body: const Center(
        child: Text("Notification Screen"),
      ),
    );
  }
}
