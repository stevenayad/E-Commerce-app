import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

class Customsearchbar extends StatelessWidget {
  const Customsearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        style: AppTextStyle.withColor(
          AppTextStyle.bodyMedium,
          Theme.of(context).textTheme.bodyLarge!.color!,
        ),
        decoration: InputDecoration(
          hint: Text('Search'),
          hintStyle: AppTextStyle.withColor(
            AppTextStyle.buttonMedium,
            isDark ? Colors.grey[400]! : Colors.grey[600]!,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
          ),
          suffixIcon: Icon(
            Icons.tune,
            color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
          ),
          filled: true,
          fillColor: isDark ? Colors.grey[800]! : Colors.grey[100]!,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 1,
              color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
