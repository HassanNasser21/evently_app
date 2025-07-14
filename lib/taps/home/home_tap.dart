import 'package:evently/app_theme.dart';
import 'package:flutter/material.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text('Home',style: TextStyle(color: AppTheme.black),),));
  }
}