import 'package:flutter/material.dart';

import 'package:meal/widgets/main_drawer.dart';

// ignore: must_be_immutable
class FiltersScreen extends StatefulWidget {
  static const String routeName = "filters";
  Map<String, bool> filters;
  Function saveFilters;
  FiltersScreen({
    required this.filters,
    required this.saveFilters,
  });
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  bool glutenFree = false;
  bool lactoseFree = false;
  bool vegan = false;
  bool vegetarian = false;
  
  @override
  void initState() {
    glutenFree = widget.filters["gluten"] as bool;
    lactoseFree = widget.filters["lactose"] as bool;
    vegan = widget.filters["vegan"] as bool;
    vegetarian = widget.filters["vegetarian"] as bool;

    super.initState();
  }

  Widget buildSwitchListTile(String title, String subtitle, bool currentValue,
          Function updateValue) =>
      SwitchListTile(
        title: Text("$title"),
        subtitle: Text("$subtitle"),
        value: currentValue,
        onChanged: (val) => updateValue(val),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filters",
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
            onPressed: () {
              final Map<String, bool> selectedFilter = {
                'gluten': glutenFree,
                'lactose': lactoseFree,
                'vegan': vegan,
                'vegetarian': vegetarian,
              };
              widget.saveFilters(selectedFilter);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile("Gluten-free",
                      "Only include gluten-free meals.", glutenFree, (val) {
                    setState(() {
                      glutenFree = val;
                    });
                  }),
                  buildSwitchListTile("Lactose-free",
                      "Only include lactose-free meals.", lactoseFree, (val) {
                    setState(() {
                      lactoseFree = val;
                    });
                  }),
                  buildSwitchListTile(
                      "Vegan-free", "Only include vegan-free meals.", vegan,
                      (val) {
                    setState(() {
                      vegan = val;
                    });
                  }),
                  buildSwitchListTile("Vegetarian-free",
                      "Only include vegetarian-free meals.", vegetarian, (val) {
                    setState(() {
                      vegetarian = val;
                    });
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
