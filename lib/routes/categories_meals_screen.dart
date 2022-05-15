import 'package:flutter/material.dart';
import 'package:restaurant_app/models/meal.dart';
import 'package:restaurant_app/widgets/meal_item.dart';

class CategoriesMeal extends StatefulWidget {
  final List<Meal> avalibleMeals;
  CategoriesMeal(this.avalibleMeals);
  @override
  State<CategoriesMeal> createState() => _CategoriesMealState();
}

class _CategoriesMealState extends State<CategoriesMeal> {
  // final String categoryId;
  String? catTitle;
  List<Meal>? diplayedMeals;
  var initedData = false;
  @override
  void didChangeDependencies() {
    if (!initedData) {
      final routeArg =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      catTitle = routeArg['title'] as String;
      final catId = routeArg['id'] as String;
      diplayedMeals = widget.avalibleMeals
          .where((meal) => meal.categories.contains(catId))
          .toList();
      initedData = true;
    }

    super.didChangeDependencies();
  }

  void _removeId(String id) {
    setState(() {
      diplayedMeals?.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(catTitle!)),
        body: ListView.builder(
          itemBuilder: (BuildContext context, index) {
            return MealItem(
                title: diplayedMeals![index].title,
                imageUrl: diplayedMeals![index].imageUrl,
                duration: diplayedMeals![index].duration,
                complexity: diplayedMeals![index].complexity,
                affordability: diplayedMeals![index].affordability,
                id: diplayedMeals![index].id);
          },
          itemCount: diplayedMeals?.length,
        ));
  }
}
