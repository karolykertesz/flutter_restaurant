import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class MealDeytailScreen extends StatelessWidget {
  final Function togglefavorite;
  final Function isfavorite;

  MealDeytailScreen(this.togglefavorite, this.isfavorite);
  Widget _buildTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }

  Widget _buildContainer(BuildContext context, double heigth, Widget child) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 210, 207, 207)),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * heigth,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String mealId = routeArg['id'] as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: _buildTitle(context, "ingredients"),
            ),
            _buildContainer(
                context,
                0.20,
                ListView.builder(
                    itemCount: selectedMeal.ingredients.length,
                    itemBuilder: (ctx, index) {
                      return Card(
                        color: Theme.of(context).colorScheme.secondary,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(selectedMeal.ingredients[index])),
                      );
                    })),
            _buildTitle(context, "Steps"),
            _buildContainer(
                context,
                0.15,
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text("#${index + 1}"),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider()
                      ],
                    );
                  },
                  itemCount: selectedMeal.steps.length,
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isfavorite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => togglefavorite(mealId),
      ),
    );
  }
}
