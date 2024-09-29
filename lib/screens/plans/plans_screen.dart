import 'package:flutter/material.dart';
import 'package:homy/utils/appbar_component.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screenAppBar(context, showProfile: true),
      body: const Center(
        child: Text("Plan Screen"),
      ),
    );
  }
}
