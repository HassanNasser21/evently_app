import 'package:evently/app_theme.dart';
import 'package:evently/onboarding_screens/onboarding_data_class.dart';
import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  OnboardingDataClass page = OnboardingDataClass();
  OnboardingItem({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
        
          children: [
            Image.asset(
              'assets/images/${page.image}.png',
              height: 415,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Text(
              '${page.title}',
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: AppTheme.primary),
            ),
            Text(
              '${page.description}',
              textAlign: TextAlign.start,
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(color: AppTheme.black),
            ),
          ],
        ),
      ),
    );
  }
}