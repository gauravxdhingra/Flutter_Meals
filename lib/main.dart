import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'veg': false,
  };
  List<Meal> availableMeals = DUMMY_MEALS;

  void _saveFilters(Map<String, bool> filterdata) {
    setState(() {
      _filters = filterdata;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['veg'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amberAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      // home: CatagoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),

        // '/category-meals': (ctx) => CategoryMealsScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(
              _filters,
              _saveFilters,
            ),
      },
    );
  }
}
