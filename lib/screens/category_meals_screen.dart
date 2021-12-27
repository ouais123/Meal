import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';
import 'package:meal/models/category.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = "category_meals";
  final List<Meal> availableMeals;
  const CategoryMealsScreen({required this.availableMeals});

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String? categoryId;
  late String? categoryTitle;
  late List<Meal> categoryMeals;

  @override
  void didChangeDependencies() {
    final Map<String, String> routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryId = routeArg["id"];
    categoryTitle = routeArg["title"];
    categoryMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    super.didChangeDependencies();
  }

  void removeMael(String mealID) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(
          categoryTitle!,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUri: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
      ),
    );
  }
}
