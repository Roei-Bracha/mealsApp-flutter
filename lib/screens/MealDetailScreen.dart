import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreenArguments {
  final String id;

  MealDetailScreenArguments({this.id});
}

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  const MealDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MealDetailScreenArguments argumets =
        ModalRoute.of(context).settings.arguments;
    final String id = argumets.id;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl),
            ),
            SectionTitle('Ingrediants'),
            BuildContiner(
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  margin: const EdgeInsets.all(10),
                  color: Theme.of(context).accentColor,
                  elevation: 5,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            SectionTitle('Steps'),
            BuildContiner(
              child: ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text((index + 1).toString()),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider()
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(
    this.title, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

class BuildContiner extends StatelessWidget {
  final Widget child;
  const BuildContiner({this.child, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      child: child,
    );
  }
}
