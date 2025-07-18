import 'package:evently/app_theme.dart';
import 'package:evently/taps/home/home_header.dart';
import 'package:flutter/material.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeHeader(),
      ],
    );
  }
}