import "package:flutter/material.dart";
import 'package:restaurant_app/widgets/drawer_bar.dart';

class FiltersScreen extends StatefulWidget {
  static String routName = "/filters";
  final Function _savefilters;
  final Map<String, bool> filteredState;

  FiltersScreen(this._savefilters, this.filteredState);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegeterian = false;
  var _isLactoseFree = false;

  @override
  void initState() {
    _isGlutenFree = widget.filteredState['gluten']!;
    _isLactoseFree = widget.filteredState['lactose']!;
    _isVegan = widget.filteredState['vegan']!;
    _isVegeterian = widget.filteredState['vegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawerbar(),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final filters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegeterian
                };
                print(_isVegeterian);
                widget._savefilters(filters);
              },
              icon: Icon(Icons.save))
        ],
        title: Text("Filters"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.topCenter,
            child: Text(
              "Adjust your meals!",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                  value: _isGlutenFree,
                  title: Text("Gluten-free"),
                  onChanged: (newValue) {
                    setState(() {
                      _isGlutenFree = newValue;
                    });
                  },
                  subtitle: Text("Only include Gluten-free"),
                  inactiveTrackColor: Theme.of(context).colorScheme.secondary),
              SwitchListTile(
                  value: _isVegan,
                  subtitle: Text("Only include Vegan"),
                  title: Text("Vegan"),
                  onChanged: (newValue) {
                    setState(() {
                      _isVegan = newValue;
                    });
                  },
                  inactiveTrackColor: Theme.of(context).colorScheme.secondary),
              SwitchListTile(
                  value: _isLactoseFree,
                  title: Text("Lactose-free"),
                  subtitle: Text("Only include Lactose-free"),
                  onChanged: (nv) {
                    setState(() {
                      _isLactoseFree = nv;
                    });
                  },
                  inactiveTrackColor: Theme.of(context).colorScheme.secondary),
              SwitchListTile(
                  value: _isVegeterian,
                  title: Text("Vegetarian"),
                  subtitle: Text("Only include Vegetarian"),
                  onChanged: (nv) {
                    setState(() {
                      _isVegeterian = nv;
                    });
                  },
                  inactiveTrackColor: Theme.of(context).colorScheme.secondary)
            ],
          ))
        ],
      ),
    );
  }
}
