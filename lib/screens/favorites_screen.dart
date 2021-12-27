import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({required this.favoritesMeals});
  final List<Meal> favoritesMeals;

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoritesMeals.isEmpty)
      return Center(
        child: Text("You have no favorites yet - start adding some!"),
      );
    else
      return ListView.builder(
        itemCount: widget.favoritesMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
            id: widget.favoritesMeals[index].id,
            title: widget.favoritesMeals[index].title,
            imageUri: widget.favoritesMeals[index].imageUrl,
            duration: widget.favoritesMeals[index].duration,
            complexity: widget.favoritesMeals[index].complexity,
            affordability: widget.favoritesMeals[index].affordability,
          );
        },
      );
  }
}
