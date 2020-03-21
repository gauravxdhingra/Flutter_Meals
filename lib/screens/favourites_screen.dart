import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatefulWidget {
  // // const FavouritesScreen({Key key}) : super(key: key);

  final List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favouriteMeals.isEmpty) {
      return Container(
        child: Center(
          child: Text('No Favourites Yet - Start adding some!'),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: widget.favouriteMeals[index].id,
            title: widget.favouriteMeals[index].title,
            imageUrl: widget.favouriteMeals[index].imageUrl,
            affordability: widget.favouriteMeals[index].affordability,
            complexity: widget.favouriteMeals[index].complexity,
            duration: widget.favouriteMeals[index].duration,
          );
        },
        itemCount: widget.favouriteMeals.length,
      );
    }
  }
}
