import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import 'package:restaurant_app/models/meal.dart';
import 'package:restaurant_app/routes/error_screen.dart';
import 'package:restaurant_app/routes/filters_screen.dart';
import 'package:restaurant_app/routes/meal_delail_screen.dart';
import 'package:restaurant_app/routes/tab_botton_screen.dart';
import '../routes/categories_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _avMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      _avMeals.where((element) {
        if (filters['gluten'] == true && !element.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] == true && !element.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] == true && !element.isVegan) {
          return false;
        }
        if (filters['vegetarian'] == true && !element.isVegetarian) {
          return false;
        }
        print(filters);
        return true;
      }).toList();
    });
  }

  void toggleFavorites(String mealId) {
    final int index =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (index >= 0) {
      setState(() {
        _favoriteMeals.removeAt(index);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealfavorite(String id) {
    return _favoriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
          appBarTheme: AppBarTheme.of(context).copyWith(
            backgroundColor: Colors.amber,
            titleTextStyle: TextStyle(
                fontFamily: "Ralaway",
                fontSize: 22,
                fontWeight: FontWeight.w600),
          ),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                    color: Color.fromARGB(200, 51, 51, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Ralaway"),
                bodyText2: TextStyle(
                    color: Color.fromARGB(200, 51, 51, 1),
                    fontSize: 18,
                    fontFamily: "Ralaway"),
              ),
          primaryIconTheme: IconThemeData(color: Colors.white),
          fontFamily: "Relaway",
          primaryColor: Colors.amber,
          canvasColor: Color.fromARGB(255, 244, 244, 238),
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(secondary: Color.fromARGB(255, 126, 165, 219))),
      routes: {
        '/categories': (ctx) => CategoriesMeal(_avMeals),
        '/': (ctx) => TabBottonNavigationScreen(_favoriteMeals),
        '/mealdetails': (ctx) =>
            MealDeytailScreen(toggleFavorites, _isMealfavorite),
        FiltersScreen.routName: (ctx) => FiltersScreen(_setFilters, filters)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => ErrorScreen());
      },
    );
  }
}
