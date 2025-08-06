import 'package:evently/app_theme.dart';
import 'package:evently/auth/login_screen.dart';
import 'package:evently/firebase_services.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/taps/profile/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTap extends StatefulWidget {
  @override
  State<ProfileTap> createState() => _ProfileTapState();
}

class _ProfileTapState extends State<ProfileTap> {
  List<Language> languages = [
    Language(code: 'en', name: 'English'),
    Language(code: 'ar', name: 'العربيه'),
  ];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileHeader(),
        SizedBox(height: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Language',
                      style: textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.black,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.primary, width: 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: DropdownButton(
                        value: 'ar',
                        items: languages
                            .map(
                              (language) => DropdownMenuItem(
                                value: language.code,
                                child: Text(
                                  language.name,
                                  style: textTheme.titleLarge!.copyWith(
                                    color: AppTheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {},
                        borderRadius: BorderRadius.circular(16),
                        underline: SizedBox(),
                        iconEnabledColor: AppTheme.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dark Theme',
                      style: textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.black,
                      ),
                    ),
                    Switch(
                      value: true,
                      onChanged: (value) {},
                      activeTrackColor: AppTheme.primary,
                    ),
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    FirebaseServices.logout().then((_) {
                      Provider.of<UserProvider>(
                        context,
                        listen: false,
                      ).UpdateCurrentUser(null);
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(LoginScreen.routeName);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.red,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: AppTheme.white, size: 24),
                        SizedBox(width: 8),
                        Text('Logout', style: textTheme.titleLarge),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Language {
  String code;
  String name;
  Language({required this.code, required this.name});
}
