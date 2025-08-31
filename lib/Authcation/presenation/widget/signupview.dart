import 'package:flutter/material.dart';
import 'package:flutter_application_1/Authcation/presenation/Signinview.dart';
import 'package:flutter_application_1/Authcation/presenation/widget/custom_textfelid.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class signupbody extends StatelessWidget {
  signupbody({super.key});
  final TextEditingController name = TextEditingController();
  final TextEditingController passwodr = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
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
                'Create Account',
                style: AppTextStyle.withColor(
                  AppTextStyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),

              const SizedBox(height: 8),
              Text(
                'Signup  To Use APP',
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[800]!,
                ),
              ),
              const SizedBox(height: 24),
              CustomTextfelid(
                label: 'name',
                prefixicon: Icons.present_to_all_outlined,
                textEditingController: name,
                keywordtype: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please entre name';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 12),

              CustomTextfelid(
                label: 'Email',
                prefixicon: Icons.email_outlined,
                textEditingController: emailcontroller,
                keywordtype: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please entre Email';
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
                textEditingController: passwordcontroller,
                keywordtype: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please entre Password';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 12),

              CustomTextfelid(
                label: 'Conforim Password',
                prefixicon: Icons.password_outlined,
                textEditingController: passwodr,
                keywordtype: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please entre Password';
                  }
                  if (!GetUtils.isEmail(value)) {
                    return 'please entre vaild Password';
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
                    //Get.to(() => Signinbody());
                  },
                  child: Text(
                    'Sign up',
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
                    'Already have Account',
                    style: AppTextStyle.withColor(
                      AppTextStyle.bodyMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[800]!,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.off(() => Signinview());
                    },
                    child: Text(
                      'Sign in',
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
