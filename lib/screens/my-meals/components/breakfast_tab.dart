import 'package:flutter/material.dart';
import 'package:homy/screens/my-meals/components/meal_item_list_component.dart';

class BreakfastTab extends StatefulWidget {
  final List<Map<String, String>> meals;
  const BreakfastTab({super.key, required this.meals});

  @override
  State<BreakfastTab> createState() => _BreakfastTabState();
}

class _BreakfastTabState extends State<BreakfastTab>
    with AutomaticKeepAliveClientMixin<BreakfastTab> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: widget.meals.length,
      itemBuilder: (context, index) {
        return buildMealItem(
            widget.meals[index]['date']!, widget.meals[index]['meal']!);
      },
    );
  }
}
