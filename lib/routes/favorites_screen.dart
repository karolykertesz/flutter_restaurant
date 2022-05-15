import "package:flutter/material.dart";
import 'package:restaurant_app/models/meal.dart';
import 'package:restaurant_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> myFavorites;
  FavoritesScreen(this.myFavorites);
  @override
  Widget build(BuildContext context) {
    return myFavorites.isEmpty
        ? Center(
            child: Text("You didn't give any favorite!"),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return MealItem(
                id: myFavorites[index].id,
                title: myFavorites[index].title,
                imageUrl: myFavorites[index].imageUrl,
                duration: myFavorites[index].duration,
                affordability: myFavorites[index].affordability,
                complexity: myFavorites[index].complexity,
              );
            },
            itemCount: myFavorites.length);
  }
}
