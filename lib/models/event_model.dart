import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/category_model.dart';

class EventModel {
  String id;
  String userId;
  CategoryModel category;
  String title;
  String description;
  DateTime dateTime;

  EventModel({
    this.id = '',
    required this.userId,
    required this.category,
    required this.title,
    required this.description,
    required this.dateTime,
  });

  Map<String, dynamic> tojson() => {
    'id': id,
    'userId': userId,
    'category': category.id,
    'title': title,
    'description': description,
    'timestamp': Timestamp.fromDate(dateTime),
  };

  EventModel.fromjson(Map<String, dynamic> json)
    : this(
        id: json['id'],
        userId: json['userId'],
        category: CategoryModel.categories.firstWhere(
          (category) => category.id == json['category'],
        ),
        title: json['title'],
        description: json['description'],
        dateTime: (json['timestamp'] as Timestamp).toDate(),
      );
}
