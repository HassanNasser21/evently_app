import 'package:evently/app_theme.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/taps/home/tap_item.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: AppTheme.primary,
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
      ),
      padding: const EdgeInsets.only(left: 16, bottom: 16),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Welcome Back ✨',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text('user name', style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 16),
            DefaultTabController(
              length: CategoryModel.categories.length + 1,
              child: TabBar(
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                labelPadding: const EdgeInsets.only(right: 10),
                tabAlignment: TabAlignment.start,
                onTap: (index) {
                  if (currentIndex == index) return;
                  currentIndex = index;
                  setState(() {
                    
                  });
                },
                tabs: [
                  TapItem(
                    label: 'ALL',
                    icon: Icons.ac_unit_rounded,
                    isselected: currentIndex == 0,
                    selectedbackgroundcolor: AppTheme.white,
                    selectedforegroundcolor: AppTheme.primary,
                    unselectedforegroundcolor: AppTheme.white,
                  ),
               ...  CategoryModel.categories.map((category) => TapItem(
                   label: category.name,
                   icon: category.icon,
                   isselected: currentIndex == CategoryModel.categories.indexOf(category) + 1,
                   selectedbackgroundcolor: AppTheme.white,
                   selectedforegroundcolor: AppTheme.primary,
                   unselectedforegroundcolor: AppTheme.white,
                 ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
