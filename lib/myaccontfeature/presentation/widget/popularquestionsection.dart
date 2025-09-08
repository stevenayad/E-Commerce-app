import 'package:flutter/material.dart';
import 'package:flutter_application_1/myaccontfeature/presentation/widget/questioncard.dart';
import 'package:flutter_application_1/myaccontfeature/presentation/widget/showanswerbottomsheet.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

class popluarquestionsection extends StatelessWidget {
  const popluarquestionsection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Section',
            style: AppTextStyle.withColor(
              AppTextStyle.h3,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          const SizedBox(height: 6),
          Questioncard(
            title: "How to track my orders?",
            icon: Icons.local_shipping_outlined,
          ),
          Questioncard(
            title: "How to return an item",
            icon: Icons.local_shipping_outlined,
          ),
        ],
      ),
    );
  }
}
