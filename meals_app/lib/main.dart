import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tabs.screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_details_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String , bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availbleMeals = DUMMY_MEALS ;
  List<Meal> _favoriteMeals = [] ;

  void _setFilters (Map<String , bool> _filtersData){

  setState(() {
    _filters = _filtersData;

    _availbleMeals = DUMMY_MEALS.where((meal){
      if ( _filters['gluten'] == true && meal.isGlutenFree == false){
        return false;
      };
      if ( _filters['lactose'] == true && meal.isLactoseFree == false){
        return false;
      };
      if ( _filters['vegan'] == true && meal.isVegan == false){
        return false;
      };
      if ( _filters['vegetarian'] == true && meal.isVegetarian == false){
        return false;
      };

      return true;
    }).toList();
  });
  }

  void _toggleFavorite(String mealId){
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isMealFavorite(String id){
    return _favoriteMeals.any((meal) => meal.id == id);
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App_Meals',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Color(0xFF8F2929),
        canvasColor: Color(0xFF1E5968),
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Colors.white
          ),
          body2: TextStyle(
            color: Colors.black
          ),
          title: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.w700
          )
        )
      ),
      // home:MyHomePage(),

      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName:(context) => CategoryMealsScreen(_availbleMeals),
        MealDetailsScreen.routeName:(context) => MealDetailsScreen(_toggleFavorite ,isMealFavorite ),
        FiltersScreen.routeName: (context) => FiltersScreen(_setFilters , _filters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: null,

    );
  }
}
