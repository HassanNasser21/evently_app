import 'package:evently/app_theme.dart';
import 'package:evently/event_details_screen.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventItem extends StatelessWidget {
  EventModel event;
   EventItem(this.event);

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(EventDetailsScreen.routeName, arguments: event);
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/${event.category.imageName}',
              height: screensize.height * 0.23,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  '${event.dateTime.day}',
                  style: textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                  ),
                ),
                Text(
                  DateFormat('MMM').format(event.dateTime),
                  style: textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                  ),
                ),
              ],
            ),
          ),
      
          Positioned(
            width: screensize.width - 32,
            bottom: 8,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                   event.title,
                    style: textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.favorite,
                      size: 24,
                      color: AppTheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
