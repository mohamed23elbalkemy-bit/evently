import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class EventDm {
  String id;
  String ownerId;
  CategoryDM category;
  String title;
  String description;
  DateTime dateTime;
  EventDm({
    required this.id,
    required this.ownerId,
    required this.category,
    required this.dateTime,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toJson(EventDm event) {
    return {
      "id":id,
      "ownerId": ownerId,
      "category": category.toJson(),
      "title": title,
      "description": description,
      "dateTime": dateTime,
    };
  }

  static EventDm fromJson(Map<String, dynamic> json) {
    Timestamp timeStamp = json["dateTime"];
    return EventDm(
      id: json["id"],
      ownerId: json["ownerId"],
      category: CategoryDM.formJson(json["category"]),
      dateTime: timeStamp == null ? DateTime.now() : timeStamp.toDate(),
      title: json["title"],
      description: json["description"],
    );
  }
}

class CategoryDM {
  late String name;
  late String imagePath;
  late IconData icon;
  CategoryDM({required this.name, required this.icon, required this.imagePath});

  static CategoryDM formJson(Map<String,dynamic> json){
    int codePoint = json["icon"];
    return CategoryDM(name: json["name"], icon: IconData(codePoint), imagePath: json["imagePath"]);
  }
  toJson(){
    return{
      "name":name,
      "imagePath":imagePath,
      "icon":icon.codePoint ,

    };
  }
}
