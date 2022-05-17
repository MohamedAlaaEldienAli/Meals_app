import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title , IconData icon , Function tapHandler){
    return ListTile(
      leading: Icon(icon ,size: 25,),
      title: Text(title , style: TextStyle(
        fontSize: 22,
        fontFamily: 'RobotoCondensed',
        fontWeight: FontWeight.bold,
      ),),
      onTap: tapHandler ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor ,
            child: Text(
              "cooking Up",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(height: 20,),
          buildListTile("Meal", Icons.restaurant , (){Navigator.of(context).pushReplacementNamed('/');}),
          buildListTile("Filters", Icons.filter_vintage_sharp ,(){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);}),
        ],
      ),
    );
  }
}
