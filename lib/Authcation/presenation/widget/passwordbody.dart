import 'package:flutter/material.dart';
import 'package:flutter_application_1/Authcation/presenation/widget/custom_textfelid.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;

class passwordbody extends StatelessWidget {
  passwordbody({super.key});
  final TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Reset Password',
                style: AppTextStyle.withColor(
                  AppTextStyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),

              const SizedBox(height: 12),
              Text(
                'Enter your Email to Reset Password',
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[800]!,
                ),
              ),
              const SizedBox(height: 12),
              CustomTextfelid(
                label: 'Email',
                prefixicon: Icons.email_outlined,
                textEditingController: emailcontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please entre email';
                  }
                  if (!GetUtils.isEmail(value)) {
                    return 'please entre vaild email';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    ShowSuccessDaliog(context);
                  },
                  child: Text(
                    'Reset Password',
                    style: AppTextStyle.withColor(
                      AppTextStyle.h3,
                      Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void ShowSuccessDaliog(BuildContext context) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text('Check your email', style: AppTextStyle.h3),
          content: Text('Do you Sure?', style: AppTextStyle.bodyMedium),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'OK',
                style: AppTextStyle.withColor(
                  AppTextStyle.buttonMedium,
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
  );
}
