import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meals_app/screens/filters_screen.dart';

class DrawerMain extends StatelessWidget {
  Widget buildTile(String title, IconData icon, Function handler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          fontFamily: 'RobotoCondensed',
        ),
      ),
      onTap: handler,
      hoverColor: Colors.blueGrey,
      contentPadding: EdgeInsets.only(
        left: 10,
        top: 5,
      ),
      minLeadingWidth: 40,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.only(left: 20, top: 60),
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 40,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildTile(
            'Meals',
            Icons.restaurant,
            () {
              print("Meals");
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildTile(
            'Filters',
            Icons.filter,
            () {
              print("Filters");
              Navigator.of(context).pushReplacementNamed(FiltersScreen.route);
            },
          ),
        ],
      ),
    );
  }
}
