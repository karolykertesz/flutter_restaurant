import 'package:flutter/material.dart';
import '../routes/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  CategoryItem(this.color, this.title, this.id);
  // void selectcategory(BuildContext cxt) {
  //   Navigator.of(cxt).push(MaterialPageRoute(
  //       builder: (_) {
  //         return CategoriesMeal();
  //       },
  //       fullscreenDialog: true));
  //   // can by CoupertinoPageRoute
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => CategoriesMeal(id, title),
      //         fullscreenDialog: true)),
      onTap: () => Navigator.of(context)
          .pushNamed('/categories', arguments: {'id': id, 'title': title}),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [color.withOpacity(0.7), color],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight),
              borderRadius: BorderRadius.circular(15))),
    );
  }
}
