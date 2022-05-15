import "package:flutter/material.dart";
import 'package:restaurant_app/routes/filters_screen.dart';

class Drawerbar extends StatelessWidget {
  const Drawerbar({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, Function handler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 22,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: "Roboto", fontSize: 20, fontWeight: FontWeight.bold),
      ),
      onTap: () => handler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              height: 120,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              alignment: Alignment.bottomCenter,
              child: Text(
                "Eat All!",
                style: Theme.of(context).textTheme.bodyText1,
              )),
          SizedBox(
            height: 20,
          ),
          buildListTile("Meals", Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          buildListTile("Filters", Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routName);
          }),
        ],
      ),
    );
  }
}
