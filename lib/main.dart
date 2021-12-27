import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';
import 'package:meal/screens/category_meals_screen.dart';
import 'package:meal/screens/filters_screen.dart';
import 'package:meal/screens/meal_detail_screen.dart';
import 'package:meal/screens/tap_screen.dart';
import 'package:meal/models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] as bool && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] as bool && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] as bool && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] as bool && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealID) {
    int index = favoritesMeals.indexWhere((meal) => meal.id == mealID);
    if (index >= 0) {
      setState(() {
        favoritesMeals.removeAt(index);
      });
    } else {
      setState(() {
        favoritesMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID));
      });
    }
  }

  bool isMealFavorite(String mealID) =>
      favoritesMeals.any((meal) => meal.id == mealID);

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoritesMeals = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "RobotoCondensed",
              ),
              bodyText2: TextStyle(),
              headline4: TextStyle(
                fontSize: 23,
                color: Colors.black,
                fontFamily: "RobotoCondensed",
              ),
              headline5: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: "Raleway",
              ),
              headline6: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: "Raleway",
              ),
            ),
      ),
      routes: {
        "/": (context) => TapsScreen(
              favoritesMeals: favoritesMeals,
            ),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(
              availableMeals: availableMeals,
            ),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
            toggleFavorite: toggleFavorite, isMealFavorite: isMealFavorite),
        FiltersScreen.routeName: (context) => FiltersScreen(
              filters: filters,
              saveFilters: setFilters,
            ),
      },
    );
  }
}
