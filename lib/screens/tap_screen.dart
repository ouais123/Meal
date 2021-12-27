import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/categories_screen.dart';
import 'package:meal/screens/favorites_screen.dart';
import 'package:meal/widgets/main_drawer.dart';

class TapsScreen extends StatefulWidget {
  const TapsScreen({required this.favoritesMeals});
  final List<Meal> favoritesMeals;

  @override
  _TapsScreenState createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {
  late List<Map<String, Object>> pages;
  @override
  void initState() {
    pages = [
      {
        "page": CategoriesScreen(),
        "title": "Catogories",
      },
      {
        "page": FavoritesScreen(favoritesMeals: widget.favoritesMeals),
        "title": "Favorites",
      },
    ];
    super.initState();
  }

  int selectedPage = 0;
  void selectPage(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(
          "${pages[selectedPage]['title'] as String}",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      drawer: MainDrawer(),
      body: pages[selectedPage]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        selectedFontSize: 14,
        unselectedItemColor: Colors.white,
        unselectedFontSize: 12,
        currentIndex: selectedPage,
        onTap: (index) => selectPage(index),
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          ),
        ],
      ),
    );
  }
}
