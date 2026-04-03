import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:flutter_application_1/utilis/controller/themecontroller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

Widget buildthemetoggle(context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return GetBuilder<Themecontroller>(
    builder:
        (controller) => Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color:
                    isDark
                        ? Colors.black.withOpacity(0.1)
                        : Colors.grey.withOpacity(0.2),
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            leading: Icon(
              controller.isdarkMode ? Icons.dark_mode : Icons.light,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Dark Mode',
              style: AppTextStyle.withColor(
                AppTextStyle.h3,
                isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
            ),
            trailing: Switch.adaptive(
              value: controller.isdarkMode,
              onChanged: (value) => controller.ToggleTheme(),
              activeColor: Theme.of(context).primaryColor,
            ),
          ),
        ),
  );
}
