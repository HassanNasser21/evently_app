import 'package:evently/providers/events_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/widgets/custom_text_form_field.dart';
import 'package:evently/widgets/default_elevated_button.dart';
import 'package:evently/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoveTap extends StatefulWidget {
  const LoveTap({super.key});

  @override
  State<LoveTap> createState() => _LoveTapState();
}

class _LoveTapState extends State<LoveTap> {
  late EventsProvider eventsProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<String> favouriteEventsIds = Provider.of<UserProvider>(
        context,
        listen: false,
      ).currentUser!.favoriteEventsIds;
      eventsProvider.filterfavouriteevents(favouriteEventsIds);
    });
  }

  @override
  Widget build(BuildContext context) {
    eventsProvider = Provider.of<EventsProvider>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomTextFormField(
              hintText: 'Search',
              prefixIconImageName: 'search',
              onChanged: (query) {},
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    EventItem(eventsProvider.favouriteEvents[index]),
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemCount: eventsProvider.favouriteEvents.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
