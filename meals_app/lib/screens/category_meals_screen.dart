import 'package:flutter/material.dart';
import '../models/meal.dart';

import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {

  static const routeName = 'category_meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List <Meal> displayMeals;

  @override

  void didChangeDependencies() {
    final routeArg = ModalRoute
        .of(context)
        .settings
        .arguments as Map <String, String>;
    final categoryID = routeArg['id'];
    categoryTitle = routeArg['title'];
    displayMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryID);
    }).toList();
    super.didChangeDependencies();
  }


  void _removMael(String mealId){
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),),
      body: ListView.builder(
        itemBuilder: (ctx, index){
          return MealItem(
            imageUrl: displayMeals[index].imageUrl,
            title: displayMeals[index].title,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
            id: displayMeals[index].id,

          );
        },
        itemCount: displayMeals.length,),
    );
  }
}
