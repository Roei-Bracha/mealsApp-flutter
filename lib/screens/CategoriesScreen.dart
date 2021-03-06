import 'package:flutter/material.dart';
import 'package:meals_app/widgets/CategoryItem.dart';

import "../dummy_data.dart";

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(25),
        children: <Widget>[
          ...DUMMY_CATEGORIES
              .map((catData) => CategoryItem(
                    id: catData.id,
                    title: catData.title,
                    color: catData.color,
                  ))
              .toList()
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      );
  }
}
