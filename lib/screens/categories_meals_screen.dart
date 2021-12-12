import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../models/meals.dart';

import '../dummy_data.dart';

class CategoriesMeals extends StatefulWidget {
  static const route = '/categories-meal-screen';
  List<Meal> allMeals;

  CategoriesMeals(this.allMeals);

  @override
  _CategoriesMealsState createState() => _CategoriesMealsState();
}

class _CategoriesMealsState extends State<CategoriesMeals> {
  List<Meal> meals;
  String catTitle;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // context is not available at initState
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    catTitle = args['title'];
    var catId = args['id'];
    meals = widget.allMeals.where((meal) {
      return meal.categories.contains(catId);
    }).toList();
    //final hello = args['hello']; -> it will not give error even if the key is not present in the map
    // args.forEach((key, value) {
    //   print("$key $value");
    // });
    // print("${args['title']} Hello");
  }

  void removeMeal(String mealId) {
    setState(() {
      meals.removeWhere((item) => item.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle == null ? "Hello" : catTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var item = meals[index];
          return MealItem(
            id: item.id,
            affordability: item.affordability,
            complexity: item.complexity,
            title: item.title,
            duration: item.duration,
            imageUrl: item.imageUrl,
            //removeMeal: removeMeal,
          );
        },
        itemCount: meals.length,
      ), // use ListView.builder when no of items is not
      // known
    );
  }
}
