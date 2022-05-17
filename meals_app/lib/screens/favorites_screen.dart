import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {

  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {

    if(favoriteMeals.isEmpty){
    return Center(
      child: Text("You have no Favorites yet  -  start adding some !"),
    );
  }
  else{
      return ListView.builder(
        itemBuilder: (ctx, index){
          return MealItem(
            imageUrl: favoriteMeals[index].imageUrl,
            title: favoriteMeals[index].title,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
            id: favoriteMeals[index].id,
          );
        },
        itemCount: favoriteMeals.length,);
    }
  }
}

