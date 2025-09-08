import 'package:flutter/material.dart';
import 'package:flutter_application_1/myaccontfeature/presentation/widget/showanswerbottomsheet.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

class Questioncard extends StatelessWidget {
  const Questioncard({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
            blurRadius: 8,
            offset: const Offset(0, 2),
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
        trailing: Icon(
          Icons.arrow_back_ios,
          size: 16,
          color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
        ),
        onTap: () {
          showAnswerBottomSheet(context, title, isDark);
        },
      ),
    );
  }
}
