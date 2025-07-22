import 'package:evently/widgets/custom_text_form_field.dart';
import 'package:evently/widgets/default_elevated_button.dart';
import 'package:evently/widgets/event_item.dart';
import 'package:flutter/material.dart';

class LoveTap extends StatelessWidget {
  const LoveTap({super.key});

  @override
  Widget build(BuildContext context) {
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
                itemBuilder: (context, index) => EventItem(),
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
