import 'package:flutter/material.dart';
import 'package:flutter_application_1/Authcation/presenation/Signinview.dart';
import 'package:flutter_application_1/onboarding/presentation/Onboardingitem.dart';
import 'package:flutter_application_1/onboarding/presentation/widget/anmationbot.dart';
import 'package:flutter_application_1/onboarding/presentation/widget/rowbutton.dart';
import 'package:flutter_application_1/splah/controller/authcontroller.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class onboardingbody extends StatefulWidget {
  const onboardingbody({super.key});

  @override
  State<onboardingbody> createState() => _onboardingbodyState();
}

class _onboardingbodyState extends State<onboardingbody> {
  void handleGetstarted() {
    final Authcontroller authcontroller = Get.find<Authcontroller>();
    authcontroller.setfirsttimeDone();
    Get.off(() => Signinview());
  }

    final PageController pageController = PageController();
    int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    List<Onboardingitem> items = [
      Onboardingitem(
        image: 'assets/images/intro.png',
        title: 'Discover Latest Trends',
        descrption:
            'Explore the newest fashion trends and find your unique style',
      ),

      Onboardingitem(
        image: 'assets/images/intro1.png',
        title: 'Quality Products',
        descrption: 'Shop premium quality products from top brands worldwide',
      ),
      Onboardingitem(
        image: 'assets/images/intro2.png',
        title: 'Easy Shopping',
        descrption: 'Simple and secure shopping',
      ),
    ];
    return Stack(
      children: [
        PageView.builder(
          itemCount: items.length,
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              currentindex = index;
            });
          },
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(height: 50,),
                Image.asset(
                  items[index].image,
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                Text(
                  items[index].title,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.withColor(
                    AppTextStyle.h1,
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                ),
                 const SizedBox(height: 8,),
                Text(
                  items[index].descrption,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.withColor(
                    AppTextStyle.bodyLarge,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                ),
              ],
            );
          },
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 80,
          child: AnimationDots(
            currentIndex: currentindex,
            itemsLength: items.length,
            isDark: isDark,
          ),
        ),
        Rowbutton(
          isDark: isDark,
          currentIndex: currentindex,
          itemsLength: items.length,
          pageController: pageController,
          onGetStarted: handleGetstarted,
        ),
      ],
    );
  }
}
