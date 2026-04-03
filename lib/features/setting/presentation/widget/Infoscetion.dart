import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final String content;

  const InfoSection({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bodyLargeColor =
        Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;
    final greyShade = isDark ? Colors.grey[380] : Colors.grey[700];

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(16), 
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color:
                isDark
                    ? Colors.black.withOpacity(0.2)
                    : Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.withColor(AppTextStyle.h3, bodyLargeColor),
          ),

          const SizedBox(height: 12),
          Text(
            content,
            style: AppTextStyle.withColor(
              AppTextStyle.bodyMedium,
              greyShade ?? Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
