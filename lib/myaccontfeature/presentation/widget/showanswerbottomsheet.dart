import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void showAnswerBottomSheet(BuildContext context, String question, bool isDark) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    question,
                    style: AppTextStyle.withColor(
                      AppTextStyle.h3,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.close,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            Text(
              _getAnswer(question),
              style: AppTextStyle.withColor(
                AppTextStyle.bodyMedium,
                isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
            ), // Text
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              onPressed: () => Get.back(),
              child: Text(
                'Got It',
                style: AppTextStyle.withColor(
                  AppTextStyle.buttonMedium,
                  Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

String _getAnswer(String question) {
  final answers = {
    'How to track my orders?':
        'To track your order:\n\n'
        '1. Go to "My Orders" in your account\n'
        '2. Select the order you want to track\n'
        '3. Click on "Track Order"\n'
        '4. You\'ll see real time updates about your package location\n\n'
        'You can also click on the tracking number in your order confirmation email to track your package directly.',
    'How to return an item':
        'To return an item:\n\n'
        '1. Go to "My Orders" in your account\n'
        '2. Select the order with the item you want to return\n'
        '3. Click on "Return Item"\n'
        '4. Select the reason for return\n'
        '5. Print the return label\n'
        '6. Pack the item securely\n'
        '7. Drop off the package at the nearest shipping location\n\n'
        'Returns must be initiated within 30 days of delivery. Once we receive the item, your refund will be processed within 5-7 business days',
  };

  return answers[question] ?? 'Answer not available';
}
