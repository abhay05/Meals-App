import 'dart:core';

import 'package:flutter/material.dart';

import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;

  CategoryItem({this.title, this.id, this.color});

  void selectCategory(ctx) {
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoriesMeals();
    //     },
    //   ),
    // );
    print("${this.title} ${this.id}");
    Navigator.pushNamed(ctx, CategoriesMeals.route, arguments: {
      'title': this
          .title, // put key as 'title' not title otherwise -> German German this is what
      // you get
      'id': this.id,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Inkwell provides ripple effect when you tap on the widget
      // along with the optap property
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(
            15), // this is not build again when the widget is build again, this object
        // remains constant
        child: Text(title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
