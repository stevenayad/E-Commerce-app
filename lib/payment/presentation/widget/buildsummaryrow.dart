import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

Widget buildSummaryRow(BuildContext context, String label, String value, bool isTotal) {
  final textStyle = isTotal ? AppTextStyle.h3 : AppTextStyle.bodyLarge;
  final color = isTotal
      ? Theme.of(context).primaryColor
      : Theme.of(context).textTheme.bodyLarge!.color!;

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: AppTextStyle.withColor(textStyle, color),
      ), 
      Text(
        value,
        style: AppTextStyle.withColor(textStyle, color),
      ), 
    ],
  );
  
}

