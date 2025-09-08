import 'package:flutter/material.dart';
import 'package:flutter_application_1/myaccontfeature/presentation/widget/buildoptiontitle.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<T?> showimagepicker<T>(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return Get.bottomSheet<T>(
    Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
            width: 40,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isDark ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
          Text(
            'Change Profile Picture',
            style: AppTextStyle.withColor(
              AppTextStyle.h3,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          const SizedBox(height: 16),
          buildOptiontitle(
            context,
            title: 'Take Photo',
            icon: Icons.camera_alt,
            onTap: () => Get.back(result: 'camera'),
            isDark: isDark,
          ),
          SizedBox(height: 12),
          buildOptiontitle(
            context,
            title: 'Choose From Gallery',
            icon: Icons.photo_library_outlined,
            onTap: () => Get.back(result: 'gallery'),
            isDark: isDark,
          ),
        ],
      ),
    ),
  );
}
