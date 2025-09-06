import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

Widget buildNavagationtitle(
  BuildContext context,
  String title,
  String subtitle,
  IconData icon,
) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return Container(
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
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(
        title,
        style: AppTextStyle.withColor(
          AppTextStyle.bodyMedium,
          Theme.of(context).textTheme.bodyLarge!.color!,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: AppTextStyle.withColor(
          AppTextStyle.bodySmall,
          isDark ? Colors.grey[400]! : Colors.grey[600]!,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: isDark ? Colors.grey[400] : Colors.grey[600],
      ),
    ),
  );
}
