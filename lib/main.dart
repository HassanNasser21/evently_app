import 'package:evently/app_theme.dart';
import 'package:evently/auth/login_screen.dart';
import 'package:evently/auth/regester_screen.dart';
import 'package:evently/create_event_screen.dart';
import 'package:evently/home_screen.dart';
import 'package:evently/onboarding_screens/onboarding_screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        LoginScreen.routeName: (context) => LoginScreen(),
        RegesterScreen.routeName: (context) => const RegesterScreen(),
        CreateEvent.routeName: (context) => const CreateEvent(),
        OnboardingScreens.routeName: (context) => const OnboardingScreens(),
      },
      initialRoute: HomeScreen.routename,
      theme: AppTheme.lighttheme,
      darkTheme: AppTheme.darktheme,
      themeMode: ThemeMode.light,
    );
  }
}
