import 'package:evently/app_theme.dart';
import 'package:evently/auth/login_screen.dart';
import 'package:evently/onboarding_screens/onboarding_data_class.dart';
import 'package:evently/onboarding_screens/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreens extends StatefulWidget {
  static const String routeName = '/onbarding-screen';

  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  int count = 3;
  final controller = PageController();
  int currentIndex = 0;
  final List<OnboardingDataClass> pages = [
    OnboardingDataClass(
      image: 'onboarding_1',
      title: 'Find Events That Inspire You',
      description:
          "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
    ),
    OnboardingDataClass(
      image: 'onboarding_2',
      title: 'Effortless Event Planning',
      description:
          "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
    ),
    OnboardingDataClass(
      image: 'onboarding_3',
      title: 'Connect with Friends & Share Moments',
      description:
          "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(color: AppTheme.white),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/onboarding_header.png',
              height: 50,
              width: 160,
              //   width: MediaQuery.sizeOf(context).height * 0.3,
              fit: BoxFit.fill,
            ),
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                controller: controller,
                itemCount: pages.length,
                itemBuilder: (context, index) =>
                    OnboardingItem(page: pages[index]),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                currentIndex==0? SizedBox(width: 37,)
            :    GestureDetector(
                  onTap: () {
                        controller.animateToPage(
                            currentIndex - 1,
                            duration: Durations.long1,
                            curve: Curves.linear,
                          );

                          setState(() {
                            currentIndex--;
                          });
                  },
                  child: Container(
                    width: 37,
                    height: 37,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.white,
                      border: Border.all(color: AppTheme.primary, width: 1),
                    ),
                    child: Icon(Icons.arrow_back, size: 17,color: AppTheme.primary,)),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: count,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: AppTheme.primary,
                    dotColor: AppTheme.black,
                    dotHeight: 7,
                    dotWidth: 7,
                    spacing: 10,
                  ),
                  onDotClicked: (index) => controller.animateToPage(
                    index,
                    duration: Durations.long1,
                    curve: Curves.linear,
                  ),
                ),
                
                  GestureDetector(
                  onTap: (){
                     if (currentIndex < pages.length - 1) {
                      controller.animateToPage(
                        currentIndex + 1,
                        duration: Durations.long1,
                        curve: Curves.linear,
                      );
                      setState(() {
                        currentIndex++;
                      });
                    }else{
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    }
                  },
                  child: Container(
                    width: 37,
                    height: 37,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.white,
                      border: Border.all(color: AppTheme.primary, width: 1),
                    ),
                    child: Icon(Icons.arrow_forward, size: 17,color: AppTheme.primary,)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
