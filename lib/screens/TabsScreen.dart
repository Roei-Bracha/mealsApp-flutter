import 'package:flutter/material.dart';
import 'package:meals_app/screens/CategoriesScreen.dart';
import 'package:meals_app/screens/FavoritesScreen.dart';
import 'package:meals_app/widgets/MainDrawer.dart';

class TabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meals"),
        ),
        drawer: MainDrawer(),
        body: TabBarView(
          children: <Widget>[CategoriesScreen(), FavoritesScreen()],
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).primaryColor,
          child: TabBar(
            tabs: [
               Tab(
                icon: Icon(Icons.category),
                text: 'categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'favoriets',
              )
            ],
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            // indicatorColor:,
          ),
        ),
      ),
    );
  }
}
