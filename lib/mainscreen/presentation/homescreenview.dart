import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainscreen/presentation/allproductview.dart';
import 'package:flutter_application_1/mainscreen/presentation/mycartview.dart';
import 'package:flutter_application_1/mainscreen/presentation/notificationview.dart';
import 'package:flutter_application_1/mainscreen/presentation/widget/catergroychips.dart';
import 'package:flutter_application_1/mainscreen/presentation/widget/customsearchbar.dart';
import 'package:flutter_application_1/mainscreen/presentation/widget/productgird.dart';
import 'package:flutter_application_1/mainscreen/presentation/widget/saleBaner.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:flutter_application_1/utilis/controller/themecontroller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Homescreenview extends StatelessWidget {
  const Homescreenview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Homescreenbody());
  }
}

class Homescreenbody extends StatelessWidget {
  const Homescreenbody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                  SizedBox(width: 12),
                  Column(
                    children: [
                      Text(
                        'Hello Alex',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        'Good Morning',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Get.to(() => NotificationsScreen());
                    },
                    icon: Icon(Icons.notifications_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(() => Mycartview());
                    },
                    icon: Icon(Icons.shopping_bag_outlined),
                  ),
                  GetBuilder<Themecontroller>(
                    builder:
                        (controller) => IconButton(
                          onPressed: () {
                            controller.ToggleTheme();
                          },
                          icon: Icon(
                            controller.isdarkMode
                                ? Icons.light_mode
                                : Icons.dark_mode,
                          ),
                        ),
                  ),
                ],
              ),
            ),
            Customsearchbar(),
            Catergroychips(),
            Salebaner(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Product',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Allproductview(),
                        ),
                      );
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            //product Grid
            Productgird(isScroll: false),
          ],
        ),
      ),
    );
  }
}
