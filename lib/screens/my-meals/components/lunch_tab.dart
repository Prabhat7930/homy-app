import 'package:flutter/material.dart';
import 'package:homy/screens/my-meals/components/meal_item_list_component.dart';

class LunchTab extends StatefulWidget {
  final List<Map<String, String>> meals;
  const LunchTab({super.key, required this.meals});

  @override
  State<LunchTab> createState() => _LunchTabState();
}

class _LunchTabState extends State<LunchTab>
    with AutomaticKeepAliveClientMixin<LunchTab> {
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
