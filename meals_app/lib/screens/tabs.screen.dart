import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../widgets/main_drawer.dart';


class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Map<String, Object>> _pages ;

  int _selectPageIndex = 0 ;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categoris',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorites' ,
      }
    ];
    super.initState();
  }

  void _selectPage(int value) {
    setState(() {
      _selectPageIndex  = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectPageIndex]['title']),),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("Categors"),),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text("Favorites"),),
        ],
      ),
      drawer: MainDrawer(),
    );
  }


}
