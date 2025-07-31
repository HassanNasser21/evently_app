import 'dart:math';

import 'package:evently/app_theme.dart';
import 'package:evently/firebase_services.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/taps/home/home_header.dart';
import 'package:evently/widgets/event_item.dart';
import 'package:flutter/material.dart';

class HomeTap extends StatefulWidget {
  HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  List<EventModel> allevents = [];
  List<EventModel> filteredEvents = [];

  @override
  void initState() {
    super.initState();
    getevents();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeHeader(filterEvents: filterEvents),
        SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) => EventItem(filteredEvents[index]),
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: filteredEvents.length,
          ),
        ),
      ],
    );
  }

  Future<void> getevents() async {
    allevents = await FirebaseServices.getEvents();
    filteredEvents = allevents;
    setState(() {});
  }

  void filterEvents(CategoryModel? category) {
    if (category == null) {
      filteredEvents = allevents;
      setState(() {});
    } else {
      filteredEvents = allevents
          .where((event) => event.category == category)
          .toList();
      setState(() {});
    }
  }
}
