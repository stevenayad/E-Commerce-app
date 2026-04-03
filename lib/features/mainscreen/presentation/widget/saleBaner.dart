import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

class Salebaner extends StatelessWidget {
  const Salebaner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get Your',
                  style: AppTextStyle.withColor(AppTextStyle.h2, Colors.white),
                ),
                Text(
                  'Specail Sale',
                  style: AppTextStyle.withColor(
                    AppTextStyle.withWeight(AppTextStyle.h2, FontWeight.bold),
                    Colors.white,
                  ),
                ),
                Text(
                  'Up t0 40%',
                  style: AppTextStyle.withColor(AppTextStyle.h2, Colors.white),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
            onPressed: () {},
            child: Text('Shop Now', style: AppTextStyle.buttonMedium),
          ),
        ],
      ),
    );
  }
}
