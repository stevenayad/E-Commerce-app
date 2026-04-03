import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

Widget buildtextfeildhelper(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return TextField(
    decoration: InputDecoration(
      hint: Text('Search for help'),
      hintStyle: AppTextStyle.withColor(
        AppTextStyle.bodyMedium,
        isDark ? Colors.grey[400]! : Colors.grey[600]!,
      ),
      prefixIcon: Icon(
        Icons.search,
        color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      )
    ),
  );
}
