import 'package:evently/app_theme.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/taps/home/tap_item.dart';
import 'package:evently/widgets/custom_text_form_field.dart';
import 'package:evently/widgets/default_elevated_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateEvent extends StatefulWidget {
  static const String routeName = '/create_event';
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Create Event')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/sports.png',
                height: MediaQuery.sizeOf(context).height * 0.23,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),

          DefaultTabController(
            length: CategoryModel.categories.length,
            child: TabBar(
              isScrollable: true,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              labelPadding: EdgeInsets.only(right: 10),
              padding: EdgeInsets.only(left: 16),
              tabs: CategoryModel.categories
                  .map(
                    (Category) => TapItem(
                      label: Category.name,
                      icon: Category.icon,
                      isselected: false,
                      selectedbackgroundcolor: AppTheme.primary,
                      selectedforegroundcolor: AppTheme.white,
                      unselectedforegroundcolor: AppTheme.primary,
                    ),
                  )
                  .toList(),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title',
                    style: textTheme.titleMedium!.copyWith(
                      color: AppTheme.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  CustomTextFormField(
                    hintText: 'Event Title',
                    prefixIconImageName: 'title',
                    controller: titlecontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter title';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Description',
                    style: textTheme.titleMedium!.copyWith(
                      color: AppTheme.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  CustomTextFormField(
                    hintText: 'Event Description',
                    controller: descriptioncontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter description';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/date.svg'),
                      SizedBox(width: 10),
                      Text(
                        'Event Date',
                        style: textTheme.titleMedium!.copyWith(
                          color: AppTheme.black,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 365)),
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                          );
                        },
                        child: Text(
                          'Choose Date',
                          style: textTheme.titleMedium!.copyWith(
                            color: AppTheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/time.svg'),
                      SizedBox(width: 10),
                      Text(
                        'Event Time',
                        style: textTheme.titleMedium!.copyWith(
                          color: AppTheme.black,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () async {
                          TimeOfDay? time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                        },
                        child: Text(
                          'Choose Time',
                          style: textTheme.titleMedium!.copyWith(
                            color: AppTheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Location',
                    style: textTheme.titleMedium!.copyWith(
                      color: AppTheme.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  InkWell(
                    onTap: () {},
                    child: Container(
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
                  ),
                  SizedBox(height: 16),
                  DefaultElevatedButton(
                    onpressed: createEvent,
                    lable: 'Add Event',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void createEvent() {
    if (formkey.currentState!.validate()) {}
  }
}
