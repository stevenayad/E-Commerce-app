import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainscreen/controller/navagationcontroller.dart';
import 'package:get/state_manager.dart';

class Custombottomnavigationbar extends StatelessWidget {
  const Custombottomnavigationbar({super.key});

  @override
  Widget build(BuildContext context) {
    final Navagationcontroller navagationcontroller = Navagationcontroller();
    return Obx(() {
      return BottomNavigationBar(
        currentIndex: navagationcontroller.currentindex.value,
        onTap: (index) => navagationcontroller.changeindex(index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Shopping',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'WishList',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
      );
    });
  }
}
