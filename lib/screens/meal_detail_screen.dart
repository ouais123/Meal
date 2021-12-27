import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/widgets/error_load_image.dart';

class MealDetailScreen extends StatefulWidget {
  static const String routeName = "meal_detail";
  final Function toggleFavorite;
  final Function isMealFavorite;

  const MealDetailScreen({
    required this.toggleFavorite,
    required this.isMealFavorite,
  });

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Widget buildSectionTitle(BuildContext context, String title) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          "$title",
          style: Theme.of(context).textTheme.headline5,
        ),
      );
  Widget bulidSectionBody(Widget child) => Container(
        height: 150,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: child,
      );
  late Meal meal;
  @override
  void didChangeDependencies() {
    final String mealID = ModalRoute.of(context)!.settings.arguments as String;
    meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${meal.title}",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Container(
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, object, tracke) {
                  return ErrorLoadImage();
                },
              ),
            ),
            buildSectionTitle(context, "Indredients"),
            bulidSectionBody(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      meal.ingredients[index],
                    ),
                  ),
                ),
                itemCount: meal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, "Steps"),
            bulidSectionBody(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("# ${index + 1}"),
                      ),
                      title: Text(
                        meal.steps[index],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
                itemCount: meal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => widget.toggleFavorite(meal.id),
        child: Icon(
          widget.isMealFavorite(meal.id) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
