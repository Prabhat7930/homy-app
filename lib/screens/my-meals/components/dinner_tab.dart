import 'package:flutter/material.dart';
import 'package:homy/screens/my-meals/components/meal_item_list_component.dart';

class DinnerTab extends StatefulWidget {
  final List<Map<String, String>> meals;
  const DinnerTab({super.key, required this.meals});

  @override
  State<DinnerTab> createState() => _DinnerTabState();
}

class _DinnerTabState extends State<DinnerTab>
    with AutomaticKeepAliveClientMixin<DinnerTab> {
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
