import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './categories_screen.dart';
import '../widgets/favourites.dart';
import '../widgets/drawer_main.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favouriteMeals;

  TabsScreen(this.favouriteMeals);
  _TabsScreen createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPage = 0;

  void initState() {
    _pages = [
      {'title': "Categories", 'tab': CategoriesScreen()},
      {'title': 'Favourites', 'tab': Favourites(widget.favouriteMeals)},
    ];
    super.initState();
  }

  void _selectTab(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPage]['title']),
      ),
      body: _pages[_selectedPage]['tab'],
      drawer: DrawerMain(),
      bottomNavigationBar: BottomNavigationBar(
        onTap:
            _selectTab, // we dont' anonymous func here bcz flutter is passing the arg,
        // we don't have to do that
        currentIndex: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            title: Text("Categories"),
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favourites"),
          ),
        ],
      ),
    );
  }
}
