import 'package:flutter/material.dart';

class Category {
  @required
  final String id;
  final String title;
  final Color color;

  const Category({this.id, this.color = Colors.orange, this.title});
}
