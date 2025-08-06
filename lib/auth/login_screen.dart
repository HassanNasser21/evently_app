import 'package:evently/app_theme.dart';
import 'package:evently/auth/regester_screen.dart';
import 'package:evently/firebase_services.dart';
import 'package:evently/home_screen.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/ui_utils.dart';
import 'package:evently/widgets/custom_text_form_field.dart';
import 'package:evently/widgets/default_elevated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
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
                validator: (value) {
                  if (value == null || value.length < 5) {
                    return 'Enter valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Password',
                prefixIconImageName: 'password',
                ispassword: true,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.length < 8) {
                    return 'password must be at least 8 characters';
                  }
                  return null;
                },
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
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate()) {
      FirebaseServices.login(
            email: emailController.text,
            password: passwordController.text,
          )
          .then((user) {
            Provider.of<UserProvider>(
              context,
              listen: false,
            ).UpdateCurrentUser(user);
            Navigator.of(context).pushReplacementNamed(HomeScreen.routename);
          })
          .catchError((error) {
            String? errormessage;
            if (error is FirebaseAuthException) {
              errormessage = error.message;
            }
            UiUtils.showerrormessage(errormessage);
          });
    }
  }
}
