import 'package:evently/firebase_services.dart';
import 'package:evently/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? currentUser;
  void UpdateCurrentUser(UserModel? user) {
    currentUser = user;
    notifyListeners();
  }

  bool checkIsEventFavourite(String eventId) {
    return currentUser!.favoriteEventsIds.contains(eventId);
  }

  void addEventToFavourite(String eventId) {
    FirebaseServices.addFavoriteEvent(eventId);
    currentUser!.favoriteEventsIds.add(eventId);
    notifyListeners();
  }

  void removeEventFromFavourite(String eventId) {
    FirebaseServices.removeFavoriteEvent(eventId);
    currentUser!.favoriteEventsIds.remove(eventId);
    notifyListeners();
  }
}
