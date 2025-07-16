import 'package:evently/app_theme.dart';
import 'package:evently/auth/regester_screen.dart';
import 'package:evently/widgets/custom_text_form_field.dart';
import 'package:evently/widgets/default_elevated_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Logo.png',
              height: MediaQuery.sizeOf(context).height * 0.2,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'Email',
              prefixIconImageName: 'email',
              controller: emailController,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'Password',
              prefixIconImageName: 'password',
              controller: passwordController,
            ),
            SizedBox(height: 24),
            DefaultElevatedButton(onpressed: login, lable: 'Login'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: AppTheme.black),
                ),
                TextButton(
                  onPressed: () => Navigator.of(
                    context,
                  ).pushReplacementNamed(RegesterScreen.routeName),
                  child: Text('Create Account'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void login() {}
}
