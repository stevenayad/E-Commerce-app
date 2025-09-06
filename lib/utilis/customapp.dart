import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Customapp extends StatelessWidget implements PreferredSizeWidget {
  const Customapp({super.key, required this.title});

  final String title;
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AppBar(
      title: Text(
        title,
        style: AppTextStyle.withColor(
          AppTextStyle.h3,
          isDark ? Colors.white : Colors.black,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(Icons.arrow_back_ios),
      ),
    );
  }
}