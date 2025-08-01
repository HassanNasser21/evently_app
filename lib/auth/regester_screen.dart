import 'package:evently/app_theme.dart';
import 'package:evently/auth/login_screen.dart';
import 'package:evently/firebase_services.dart';
import 'package:evently/home_screen.dart';
import 'package:evently/widgets/custom_text_form_field.dart';
import 'package:evently/widgets/default_elevated_button.dart';
import 'package:flutter/material.dart';

class RegesterScreen extends StatefulWidget {
  static const String routeName = '/regester';
  const RegesterScreen({super.key});

  @override
  State<RegesterScreen> createState() => _RegesterScreenState();
}

class _RegesterScreenState extends State<RegesterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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
              hintText: 'Name',
              prefixIconImageName: 'person',
              controller: nameController,
            ),
            SizedBox(height: 16),
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
            DefaultElevatedButton(onpressed: register, lable: 'Create Account'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already Have Account ?',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: AppTheme.black),
                ),
                TextButton(
                  onPressed: () => Navigator.of(
                    context,
                  ).pushReplacementNamed(LoginScreen.routeName),
                  child: Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void register() {
    FirebaseServices.registerUser(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    ).then((user){
      Navigator.of(context).pushReplacementNamed(HomeScreen.routename);
    });
  }
}
