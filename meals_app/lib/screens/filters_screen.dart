import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String , bool > currentFilters;

  FiltersScreen(this.saveFilters , this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters "),
          actions: [
            IconButton(
                onPressed: (){
                  final Map<String , bool> selctedFilters ={
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.saveFilters(selctedFilters);
                },
                icon: Icon(Icons.save))
          ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              " Adjust yor meal selction . ",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                "Gluten-free",
                "Only include gluten-free meals. ",
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                "Lactose-free",
                "Only include Lactose-free meals. ",
                _lactoseFree,
                    (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                "Vegetarin",
                "Only include Vegetarin meals. ",
                _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                "Vegan",
                "Only include Vegan meals. ",
                _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              )

            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
