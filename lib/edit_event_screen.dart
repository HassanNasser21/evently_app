import 'package:evently/app_theme.dart';
import 'package:evently/firebase_services.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/taps/home/tap_item.dart';
import 'package:evently/ui_utils.dart';
import 'package:evently/widgets/custom_text_form_field.dart';
import 'package:evently/widgets/default_elevated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class EditEventScreen extends StatefulWidget {
  static const String routeName = '/Edit_event';
  const EditEventScreen({super.key});

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  EventModel? event;
  bool isInitialized = false;
  int currentIndex = 0;
  CategoryModel selectedCategory = CategoryModel.categories.first;
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  DateTime? selecteddate;
  TimeOfDay? selectedtime;
  DateFormat dateFormat = DateFormat('d/M/yyyy');
  @override
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final route = ModalRoute.of(context);
      if (route != null && route.settings.arguments is EventModel) {
        event = route.settings.arguments as EventModel;

        titlecontroller.text = event!.title;
        descriptioncontroller.text = event!.description;
        selectedCategory = event!.category;
        selecteddate = event!.dateTime;
        selectedtime = event!.dateTime != null
            ? TimeOfDay.fromDateTime(event!.dateTime!)
            : null;

        isInitialized = true;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final event = ModalRoute.of(context)!.settings.arguments as EventModel;
    if (!isInitialized || event == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Edit Event')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Edit Event')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/${selectedCategory.imageName}',
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
                      isselected:
                          currentIndex ==
                          CategoryModel.categories.indexOf(Category),
                      selectedbackgroundcolor: AppTheme.primary,
                      selectedforegroundcolor: AppTheme.white,
                      unselectedforegroundcolor: AppTheme.primary,
                    ),
                  )
                  .toList(),
              onTap: (index) {
                if (currentIndex == index) return;
                currentIndex = index;
                selectedCategory = CategoryModel.categories[currentIndex];
                setState(() {});
              },
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
                          if (date != null) {
                            selecteddate = date;
                            setState(() {});
                          }
                        },
                        child: Text(
                          "${dateFormat.format(selecteddate!)}",
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
                          if (time != null) {
                            selectedtime = time;
                            setState(() {});
                          }
                        },
                        child: Text(
                          '${selectedtime!.format(context)}',

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
                            child: SvgPicture.asset(
                              'assets/icons/location.svg',
                            ),
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
                    onpressed: updateEvent,
                    lable: 'Update Event',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void updateEvent() {
    if (formkey.currentState!.validate()) {
      event!.title = titlecontroller.text.trim();
      event!.description = descriptioncontroller.text.trim();
      event!.category = selectedCategory!;
      event!.dateTime = DateTime(
        selecteddate!.year,
        selecteddate!.month,
        selecteddate!.day,
        selectedtime!.hour,
        selectedtime!.minute,
      );
      FirebaseServices.updateEvent(event!).then((_){
        UiUtils.showsuccessmessage("Event Updated Successfully");
         Navigator.pop(context);
      });
     
    }
  }
}
