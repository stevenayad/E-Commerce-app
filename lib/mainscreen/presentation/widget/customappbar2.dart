import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainscreen/presentation/widget/filterbottomsheet.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

PreferredSizeWidget customAppBar2(BuildContext context , String text) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back, color: isDark ? Colors.white : Colors.black),
    ),
    title: Text(
      text,
      style: AppTextStyle.withColor(
        AppTextStyle.h3,
        isDark ? Colors.white : Colors.black,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.search, color: isDark ? Colors.white : Colors.black),
      ),
      IconButton(
        onPressed: () {
            FilterBottomSheet.show(context);
        },
        icon: Icon(
          Icons.filter_list,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
    ],
  );
}
