import 'package:flutter/cupertino.dart';

class EventDm {
  CategoryDM category;
  String title;
  String description;
  DateTime dateTime;
  bool isFavorite;
  EventDm({required this.category,required this.dateTime,required this.title,required this.description,required this.isFavorite});
}
class CategoryDM{
  String name;
  String imagePath;
  IconData icon;
  CategoryDM({required this.name,required this.icon,required this.imagePath});
}