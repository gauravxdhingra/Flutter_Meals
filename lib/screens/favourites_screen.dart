import 'package:flutter/material.dart';
import '../models/meal.dart';

class FavouritesScreen extends StatelessWidget {
  // // const FavouritesScreen({Key key}) : super(key: key);

  final List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Favourites Here'),
      ),
    );
  }
}
