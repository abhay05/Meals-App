import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(20),
      children: DUMMY_CATEGORIES.map((item) {
        print("Hello ${item.color}");
        return CategoryItem(
          title: item.title,
          color: item.color,
          id: item.id,
        );
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ), // Sliver -> scrollable areas on the screen
      //GridDelegate -> structuring , layout is delegated to MaxCrossAxisExtent
      //MaxCrossAxisExtent -> preconfigured class with maximum width for each grid item
    );
  }
}
