import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';

// import '../models/meal.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealsScreen(
  //   this.categoryId,
  //   this.categoryTitle,
  // );

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categorymeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: categorymeals[index].id,
              title: categorymeals[index].title,
              imageUrl: categorymeals[index].imageUrl,
              affordability: categorymeals[index].affordability,
              complexity: categorymeals[index].complexity,
              duration: categorymeals[index].duration);
        },
        itemCount: categorymeals.length,
      ),
    );
  }
}
