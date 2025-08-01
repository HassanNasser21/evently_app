import 'package:evently/app_theme.dart';
import 'package:evently/auth/login_screen.dart';
import 'package:evently/firebase_services.dart';
import 'package:evently/home_screen.dart';
import 'package:evently/ui_utils.dart';
import 'package:evently/widgets/custom_text_form_field.dart';
import 'package:evently/widgets/default_elevated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                hintText: 'Name',
                prefixIconImageName: 'person',
                controller: nameController,
                validator: (value) {
                  if (value == null || value.length < 3) {
                    return 'Enter valid name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
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
                controller: passwordController,
                ispassword: true,
                validator: (value) {
                  if (value == null || value.length < 8) {
                    return 'password must be at least 8 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              DefaultElevatedButton(
                onpressed: register,
                lable: 'Create Account',
              ),
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
      ),
    );
  }

  void register() {
    if (formKey.currentState!.validate()) {
      FirebaseServices.registerUser(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
          )
          .then((user) {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routename);
          })
          .catchError((error) {
            String? errormessage;
            if (error is FirebaseAuthException) {
              errormessage = error.message;
            }
            UiUtils.showerrormessage(errormessage);
          });
      ;
    }
  }
}
