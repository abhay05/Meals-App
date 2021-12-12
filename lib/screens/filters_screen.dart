import 'package:flutter/material.dart';
import 'package:meals_app/widgets/drawer_main.dart';

import '../models/filters.dart';

class FiltersScreen extends StatefulWidget {
  static const route = '/filters';
  final Function setFilter;
  final Filters filters;
  FiltersScreen(this.setFilter, this.filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;

  bool _isLactoseFree = false;

  bool _isVegan = false;

  bool _isVegetarian = false;

  void initState() {
    _isGlutenFree = widget.filters.isGlutenFree;
    _isLactoseFree = widget.filters.isLactoseFree;
    _isVegan = widget.filters.isVegan;
    _isVegetarian = widget.filters.isVegetarian;
    super.initState();
  }

  Widget builderSwitchTile(
    String title,
    String subtitle,
    bool val,
    Function handler,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: val,
      onChanged: handler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text("Adjust the meals which you want to select",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Expanded(
            child: ListView(
              children: [
                builderSwitchTile(
                  'Gluten-Free',
                  'Select for only gluten free food',
                  _isGlutenFree,
                  (val) {
                    setState(() {
                      _isGlutenFree = val;
                    });
                  },
                ),
                builderSwitchTile(
                  'Lactose-Free',
                  'Select for only lactose free food',
                  _isLactoseFree,
                  (val) {
                    setState(() {
                      _isLactoseFree = val;
                    });
                  },
                ),
                builderSwitchTile(
                  'Vegan',
                  'Select for only vegan food',
                  _isVegan,
                  (val) {
                    setState(() {
                      _isVegan = val;
                    });
                  },
                ),
                builderSwitchTile(
                  'Vegetarian',
                  'Select for only vegetarian food',
                  _isVegetarian,
                  (val) {
                    setState(() {
                      _isVegetarian = val;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                widget.setFilter(
                  Filters(
                    isGlutenFree: this._isGlutenFree,
                    isLactoseFree: this._isLactoseFree,
                    isVegan: this._isVegan,
                    isVegetarian: this._isVegetarian,
                  ),
                );
              })
        ],
        title: Text("Filters"),
      ),
      drawer: DrawerMain(), // appbar needs to be there for this to work
    );
  }
}
