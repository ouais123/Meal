import 'package:flutter/material.dart';
import 'package:meal/screens/category_meals_screen.dart';

class CategoriesItem extends StatefulWidget {
  final String id;
  final String title;
  final Color color;
  const CategoriesItem({
    required this.id,
    required this.title,
    required this.color,
  });

  @override
  _CategoriesItemState createState() => _CategoriesItemState();
}

class _CategoriesItemState extends State<CategoriesItem> {
  void selectCategory(BuildContext ctx) {
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        "id": widget.id,
        "title": widget.title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () => selectCategory(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                widget.color.withOpacity(0.5),
                widget.color.withOpacity(1)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            color: widget.color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}
