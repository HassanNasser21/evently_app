import 'package:evently/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {

  UserModel? currentUser;
  void UpdateCurrentUser(UserModel? user) {
    currentUser = user;
    notifyListeners();
  }

}