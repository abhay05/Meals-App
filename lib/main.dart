import 'package:flutter/material.dart';
import 'package:meals_app/models/filters.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'widgets/not_found.dart';
import './screens/filters_screen.dart';
import './dummy_data.dart';
import './models/meals.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _App createState() => _App();
}

class _App extends State<App> {
  Filters filters = new Filters(
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: false,
  );
  List<Meal> allMeals = DUMMY_MEALS;
  List<Meal> favouriteMeals = [];
  void setFilters(Filters selectedFilter) {
    setState(() {
      filters = selectedFilter;
      allMeals = DUMMY_MEALS.where((element) {
        if (filters.isGlutenFree && !element.isGlutenFree) {
          return false;
        }
        if (filters.isLactoseFree && !element.isLactoseFree) {
          return false;
        }
        if (filters.isVegan && !element.isVegan) {
          return false;
        }
        if (filters.isVegetarian && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavourite(String mealId) {
    var index = favouriteMeals.any((meal) => meal.id == mealId);
    if (index) {
      favouriteMeals.removeWhere((meal) => mealId == meal.id);
    } else {
      favouriteMeals
          .add(DUMMY_MEALS.firstWhere((element) => mealId == element.id));
    }
  }

  bool ifFavourite(String mealId) {
    return favouriteMeals.any((meal) => meal.id == mealId);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(favouriteMeals),
        CategoriesMeals.route: (ctx) => CategoriesMeals(allMeals),
        MealDetails.route: (ctx) =>
            MealDetails(this.toggleFavourite, this.ifFavourite),
        FiltersScreen.route: (ctx) => FiltersScreen(setFilters, filters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => NotFound());
      },
      // home -> entry point of application
    );
  }
}
