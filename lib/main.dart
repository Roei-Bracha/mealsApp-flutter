import 'package:flutter/material.dart';
import 'package:meals_app/screens/CategoriesScreen.dart';
import 'package:meals_app/screens/CategoryMealsScreen.dart';
import 'package:meals_app/screens/FiltersScreen.dart';
import 'package:meals_app/screens/MealDetailScreen.dart';
import 'package:meals_app/screens/TabsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotCondemsed',
                fontWeight: FontWeight.bold)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx)=> FiltersScreen(),
      },
      // when go to a route that is not registed do that:
      onGenerateRoute: (settings) {
        print(settings);
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
      // 404:
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) => CategoriesScreen()),
    );
  }
}
