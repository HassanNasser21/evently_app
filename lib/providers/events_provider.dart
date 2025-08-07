import 'package:evently/firebase_services.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';

class EventsProvider with ChangeNotifier {
  List<EventModel> allevents = [];
  List<EventModel> filteredEvents = [];
  List<EventModel> favouriteEvents = [];
  Future<void> getevents() async {
    allevents = await FirebaseServices.getEvents();
    filteredEvents = allevents;
    notifyListeners();
  }

  void filterEvents(CategoryModel? category) {
    if (category == null) {
      filteredEvents = allevents;
      notifyListeners();
    } else {
      filteredEvents = allevents
          .where((event) => event.category == category)
          .toList();
      notifyListeners();
    }
  }

  void filterfavouriteevents(List<String> favouriteEventsIds) {
    favouriteEvents = allevents
        .where((event) => favouriteEventsIds.contains(event.id))
        .toList();
    notifyListeners();
  }
}
