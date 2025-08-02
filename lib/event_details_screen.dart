import 'package:evently/app_theme.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class EventDetailsScreen extends StatefulWidget {
  static const String routeName = '/event_details';
  const EventDetailsScreen({super.key});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)!.settings.arguments as EventModel;

    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppTheme.background_light,
      appBar: AppBar(
        backgroundColor: AppTheme.background_light,
        title: Text(
          'Event Details',
          style: textTheme.titleLarge!.copyWith(color: AppTheme.primary),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
            iconSize: 24,
            color: AppTheme.primary,
          ),
          //  SizedBox(width: 3),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
            iconSize: 24,
            color: AppTheme.red,
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/${event.category.imageName}',
                height: MediaQuery.sizeOf(context).height * 0.23,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${event.title}',
              style: textTheme.headlineSmall!.copyWith(
                color: AppTheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.primary),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.calendar_month_rounded,
                      size: 24,
                      color: AppTheme.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${event.dateTime.day} ${DateFormat('MMMM').format(event.dateTime)} ${event.dateTime.year} ',
                        style: textTheme.titleMedium!.copyWith(
                          color: AppTheme.primary,
                        ),
                      ),
                      Text(
                        '${event.dateTime.hour}:${event.dateTime.minute} ${event.dateTime.hour < 12 ? 'AM' : 'PM'}',
                        style: textTheme.titleMedium!.copyWith(
                          color: AppTheme.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.primary),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SvgPicture.asset('assets/icons/location.svg'),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'choose Event Location',
                    style: textTheme.titleMedium!.copyWith(
                      color: AppTheme.primary,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppTheme.primary,
                    size: 16,
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),
            Text(
              'Description',
              textAlign: TextAlign.start,
              style: textTheme.titleMedium!.copyWith(color: AppTheme.black),
            ),
            Text(
              '${event.description}',
              textAlign: TextAlign.start,
              style: textTheme.titleMedium!.copyWith(color: AppTheme.black),
            ),
          ],
        ),
      ),
    );
  }
}
