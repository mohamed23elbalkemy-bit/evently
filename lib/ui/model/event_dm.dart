import 'package:flutter/cupertino.dart';

class EventDm {
  String ownerId;
  CategoryDM category;
  String title;
  String description;
  DateTime dateTime;
  EventDm({required this.ownerId,required this.category,required this.dateTime,required this.title,required this.description });
}
class CategoryDM{
  String name;
  String imagePath;
  IconData icon;
  CategoryDM({required this.name,required this.icon,required this.imagePath});
}