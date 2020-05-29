import 'package:flutter/material.dart';
import 'package:meals_app/widgets/MainDrawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key key}) : super(key: key);
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  Widget _buildSwitchTile(
      String title, String subTitle, bool val, Function changeVal) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        value: val,
        onChanged: changeVal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjest your meal selecton',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                _buildSwitchTile(
                    'Gluten Free', 'show only Gluten Free', _glutenFree, (val) {
                  setState(() {
                    _glutenFree = val;
                  });
                }),
                _buildSwitchTile('Vegan', 'show only Vegan', _vegan, (val) {
                  setState(() {
                    _vegan = val;
                  });
                }),
                _buildSwitchTile(
                    'Vegeterian', 'show only vegeterian', _vegetarian, (val) {
                  setState(() {
                    _vegetarian = val;
                  });
                }),
                _buildSwitchTile(
                    'Lactos free', 'show only Lactos free', _lactoseFree,
                    (val) {
                  setState(() {
                    _lactoseFree = val;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
