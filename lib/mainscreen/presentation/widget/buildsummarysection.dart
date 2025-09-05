

import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainscreen/Model/product.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

Widget buildsummaryselection(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final isFavouteproduct =
      products.where((element) => element.isfavourite).length;
  return Container(
    padding: EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: isDark ? Colors.grey[600] : Colors.grey[400],
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$isFavouteproduct Items',
              style: AppTextStyle.withColor(
                AppTextStyle.h3,
                Theme.of(context).textTheme.bodyLarge!.color!,
              ),
            ),
            Text(
              'in your Wish List',
              style: AppTextStyle.withColor(
                AppTextStyle.bodyMedium,
                isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
            ),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          onPressed: () {},
          child: Text(
            'Add To ALL Cart',
            style: AppTextStyle.withColor(
              AppTextStyle.buttonMedium,
              Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
