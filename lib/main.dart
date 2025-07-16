import 'package:evently/app_theme.dart';
import 'package:evently/auth/login_screen.dart';
import 'package:evently/auth/regester_screen.dart';
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
        LoginScreen.routeName: (context) =>  LoginScreen(),
        RegesterScreen.routeName: (context) => const RegesterScreen(),

      },
      initialRoute: LoginScreen.routeName,
      theme: AppTheme.lighttheme,
      darkTheme: AppTheme.darktheme,
      themeMode: ThemeMode.light,
    );
  }
}