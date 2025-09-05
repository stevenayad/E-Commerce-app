import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

class buildprofilesection extends StatelessWidget {
  const buildprofilesection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/avatar.jpg'),
        ),
        const SizedBox(height: 10),
        Text(
          'Steven Ayad',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'stevenayad9@gmail.com',
          style: AppTextStyle.withColor(
            AppTextStyle.bodyMedium,
            isDark ? Colors.grey[400]! : Colors.grey[600]!,
          ),
        ),
        const SizedBox(height: 10),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Edit Profile',
            style: AppTextStyle.withColor(
              AppTextStyle.bodyMedium,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
        ),
      ],
    );
  }
}
