import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';
import 'package:meal/widgets/categories_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late double itemHeight;
  late double itemWidth;

  @override
  void didChangeDependencies() {
    var size = MediaQuery.of(context).size;
    itemHeight = (size.height - kToolbarHeight - 24) / 4;
    itemWidth = size.width / 2;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map((e) => CategoriesItem(
                  id: e.id,
                  title: e.title,
                  color: e.color,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}
/*

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 4;
    final double itemWidth = size.width / 2;

    return GridView.count(
      padding: EdgeInsets.all(25),
      shrinkWrap: true,
      controller: new ScrollController(keepScrollOffset: false),
      children: DUMMY_CATEGORIES
          .map((e) => CategoriesItem(
                id: e.id,
                title: e.title,
                color: e.color,
              ))
          .toList(),
      crossAxisCount: 2,
      childAspectRatio: (itemWidth / itemHeight),
      crossAxisSpacing: 20,
    );
  }
}

*/

























