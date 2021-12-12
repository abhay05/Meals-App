import 'package:flutter/material.dart';
import '../models/meals.dart';
import './meal_item.dart';

class Favourites extends StatelessWidget {
  final List<Meal> favouriteMeals;

  Favourites(this.favouriteMeals);

  // Browse Favourites -> select meal -> click on star -> click button
  // you will notice that meal is not removed from the favourites
  // that's bcz Favourite is cache , so older data is stored.
  // if you go back to categories and come back, that meal would no longer be there
  // to fix we can convert favourites to stateful widget and trigger build when
  // favourite button is clicked but there is a better way around(State management)

  @override
  Widget build(BuildContext context) {
    return this.favouriteMeals.isEmpty
        ? Center(
            child: Text("Add Favourites"),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              var item = this.favouriteMeals[index];
              return MealItem(
                id: item.id,
                affordability: item.affordability,
                complexity: item.complexity,
                title: item.title,
                duration: item.duration,
                imageUrl: item.imageUrl,
              );
            },
            itemCount: this.favouriteMeals.length,
          );
  }
}
