import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryModel {
  String id;
  String name;
  IconData icon;
  String imageName;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.imageName,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      name: "Sports",
      icon: Icons.motorcycle,
      imageName: "sports.png",
    ),
    CategoryModel(
      id: '2',
      name: "Birthday",
      icon: Icons.cake_outlined,
      imageName: "birthday.png",
    ),
    
    CategoryModel(
      id: '3',
      name: "Meeting",
      icon: Icons.timer_off_rounded,
      imageName: "meeting.png",
    ),

  ];
}
