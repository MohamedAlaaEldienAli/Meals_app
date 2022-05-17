import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String id;


  const MealItem({
    @required this.imageUrl,
    @required this.title,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.id,

  });

  String get complexityText{
    switch(complexity){
      case Complexity.Simple : return 'Simple';
      break;

      case Complexity.Challenging : return 'Challenging';
      break;

      case Complexity.Hard : return 'Hard' ;
      break ;

      default: return 'Unknown' ;
      break;
     }
  }
  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable : return 'Affordable';
      break;

      case Affordability.Pricey : return 'Pricey';
      break;

      case Affordability.Luxurious : return 'Luxurious' ;
      break ;

      default: return 'Unknown' ;
      break;
    }
  }
  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailsScreen.routeName,
    arguments: id).then((result) {
      //if (result != null) removeItem(result);

    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(horizontal: 5 , vertical: 18),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 23, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_alarm_sharp),
                      SizedBox(width: 5,),
                      Text("$duration min" ,style: TextStyle(color: Colors.grey ,fontSize: 15),),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 5,),
                      Text("$complexityText" ,style: TextStyle(color: Colors.grey ,fontSize: 15),),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 5,),
                      Text("$affordabilityText" ,style: TextStyle(color: Colors.grey ,fontSize: 15),),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
