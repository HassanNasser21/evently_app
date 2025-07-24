import 'package:evently/app_theme.dart';
import 'package:evently/create_event_screen.dart';
import 'package:evently/nav_bar_icon.dart';
import 'package:evently/taps/home/home_tap.dart';
import 'package:evently/taps/love/love_tap.dart';
import 'package:evently/taps/map/map_tap.dart';
import 'package:evently/taps/profile/profile_tap.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [HomeTap(), MapTap(), LoveTap(), ProfileTap()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.zero,
        color: AppTheme.primary,
        child: BottomNavigationBar(
          elevation: 0,

          currentIndex: currentIndex,
          onTap: (index) {
            if (currentIndex == index) return;
            currentIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: NavBarIcon(imagename: 'home'),
              activeIcon: NavBarIcon(imagename: 'home_active'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: NavBarIcon(imagename: 'Map'),
              activeIcon: NavBarIcon(imagename: 'map_active'),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: NavBarIcon(imagename: 'Heart'),
              activeIcon: NavBarIcon(imagename: 'Heart_active'),
              label: 'Love',
            ),
            BottomNavigationBarItem(
              icon: NavBarIcon(imagename: 'profile'),
              activeIcon: NavBarIcon(imagename: 'profile_active'),
              label: 'Profile',
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(CreateEvent.routeName),
        child: const Icon(Icons.add, size: 36),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
