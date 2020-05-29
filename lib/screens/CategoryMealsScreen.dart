import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/MealItem.dart';

class CategoryMealScreenArguments {
  final String title;
  final String id;

  CategoryMealScreenArguments({this.title, this.id});
}

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final CategoryMealScreenArguments routeArgs = ModalRoute.of(context).settings.arguments;
    final categoryTitle = routeArgs.title;
    final categoryMeals =  DUMMY_MEALS.where((element) => element.categories.contains(routeArgs.id)).toList();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Container(
        child: ListView.builder(itemBuilder: (ctx,index){
          return MealItem(id:categoryMeals[index].id, title: categoryMeals[index].title, imageUrl: categoryMeals[index].imageUrl, affordability: categoryMeals[index].affordability, complexity: categoryMeals[index].complexity, duration: categoryMeals[index].duration);
        },itemCount:categoryMeals.length),
      ),
    );
  }
}
