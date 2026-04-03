import 'package:flutter/material.dart';

import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Showdailogdelteadrress {
  static void showdeleteconformationadress(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    Get.dialog(
      barrierColor: Colors.black54,
      AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Icon(
                Icons.delete_outlined,
                size: 32,
                color: Colors.red[400],
              ),
              padding: EdgeInsets.all(12),
            ),
            const SizedBox(height: 12),
            Text(
              textAlign: TextAlign.center,
              'Delete Adrees',
              style: AppTextStyle.withColor(
                AppTextStyle.h3,
                Theme.of(context).textTheme.bodyLarge!.color!,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              textAlign: TextAlign.center,
              ' Delete Adress! Do You Sure ?',
              style: AppTextStyle.withColor(
                AppTextStyle.bodyLarge,
                isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsetsGeometry.symmetric(vertical: 12),
                    ),
                    child: Text(
                      'Cancel',
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyMedium,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.red,

                      elevation: 0,
                      padding: EdgeInsetsGeometry.symmetric(vertical: 12),
                    ),
                    child: Text(
                      'Delete',
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyMedium,
                        Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
