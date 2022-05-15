import "package:flutter/material.dart";
import 'package:restaurant_app/models/meal.dart';
import 'package:restaurant_app/routes/categories_screen.dart';
import 'package:restaurant_app/routes/favorites_screen.dart';
import "../widgets/drawer_bar.dart";

class TabBottonNavigationScreen extends StatefulWidget {
  final List<Meal> favorites;
  TabBottonNavigationScreen(this.favorites);
  @override
  State<TabBottonNavigationScreen> createState() =>
      _TabBottonNavigationScreenState();
}

class _TabBottonNavigationScreenState extends State<TabBottonNavigationScreen> {
  late List<Map<String, Object>> pages;

  int selectedIndex = 0;
  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favorites), 'title': 'Favorites'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawerbar(),
      appBar: AppBar(
        title: Text(pages[selectedIndex]['title'] as String),
      ),
      body: pages[selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryIconTheme.color,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: selectedIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: "Categories"),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
            backgroundColor: Theme.of(context).primaryColor,
          )
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
