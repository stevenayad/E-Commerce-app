import 'package:flutter/material.dart';
import 'package:flutter_application_1/Authcation/presenation/Signupview.dart';
import 'package:flutter_application_1/Authcation/presenation/passwordview.dart';
import 'package:flutter_application_1/mainscreen/presentation/mainscreenview.dart';
import 'package:flutter_application_1/splah/controller/authcontroller.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:flutter_application_1/Authcation/presenation/widget/custom_textfelid.dart';

void handleSiginin() {
  final Authcontroller authController = Get.find<Authcontroller>();
  authController.loginin();
  Get.off(() => Mainscreenview());
}

class Signinbody extends StatelessWidget {
  Signinbody({super.key});

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: AppTextStyle.withColor(
                  AppTextStyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in to Continue Shopping',
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[800]!,
                ),
              ),
              const SizedBox(height: 40),
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
              CustomTextfelid(
                label: 'Password',
                prefixicon: Icons.password_outlined,
                textEditingController: emailcontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please entre passworf';
                  } else {
                    return null;
                  }
                },
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Get.to(() => Passwordview());
                  },
                  child: Text(
                    'forgot password',
                    style: AppTextStyle.withColor(
                      AppTextStyle.buttonMedium,
                      Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
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
                    handleSiginin();
                  },
                  child: Text(
                    'Sign in',
                    style: AppTextStyle.withColor(
                      AppTextStyle.h1,
                      Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have accont?',
                    style: AppTextStyle.withColor(
                      AppTextStyle.bodyMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[800]!,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.off(() => Signupview());
                    },
                    child: Text(
                      'Sign Up',
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyMedium,
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
