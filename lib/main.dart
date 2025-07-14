import 'package:evently/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Evently_app());
}

class Evently_app extends StatelessWidget {
  const Evently_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routename: (context) => const HomeScreen(),

      },
      initialRoute: HomeScreen.routename,
    );
  }
}