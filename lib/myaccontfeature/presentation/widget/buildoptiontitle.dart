import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

Widget buildOptiontitle(
  BuildContext context, {
  required String title,
  required IconData icon,
  required VoidCallback onTap,
  required bool isDark,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color:
                isDark
                    ? Colors.black.withOpacity(0.3)
                    : Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).primaryColor, size: 24),
            const SizedBox(width: 16),
            Text(
              title,
              style: AppTextStyle.withColor(
                AppTextStyle.h3,
                Theme.of(context).textTheme.bodyLarge!.color!,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: isDark ? Colors.grey[400] : Colors.grey[600],
            ),
          ],
        ),
      ),
    ),
  );
}
