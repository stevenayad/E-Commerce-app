import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

class Rowbutton extends StatelessWidget {
  final bool isDark;
  final int currentIndex;
  final int itemsLength;
  final PageController pageController;
  final VoidCallback onGetStarted;

  const Rowbutton({
    super.key,
    required this.isDark,
    required this.currentIndex,
    required this.itemsLength,
    required this.pageController,
    required this.onGetStarted,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      right: 16,
      bottom: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: onGetStarted,
            child: Text(
              'Skip',
              style: AppTextStyle.withColor(
                AppTextStyle.buttonMedium,
                isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (currentIndex < itemsLength - 1) {
                pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              } else {
                onGetStarted();
              }
            },
            child: Text(
              currentIndex < itemsLength - 1 ? 'Next' : 'Get Started',
              style: AppTextStyle.withColor(
                AppTextStyle.buttonMedium,
                Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
