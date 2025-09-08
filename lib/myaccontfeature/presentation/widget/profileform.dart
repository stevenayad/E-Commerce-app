import 'package:flutter/material.dart';
import 'package:flutter_application_1/Authcation/presenation/widget/custom_textfelid.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.black.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ), 
              ],
            ), 
            child: const CustomTextfelid(
              label: 'Full Name',
              prefixicon: Icons.person_outline,
              initialvlaue: 'Steven Ayad',
            ), 
          ), 
          const SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.black.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ), 
              ],
            ), 
            child: const CustomTextfelid(
              label: 'Email',
              prefixicon: Icons.email_outlined,
              initialvlaue: 'stevenayad9@gmail.com',
              keywordtype: TextInputType.emailAddress,
            ), 
          ), 
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.black.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ), 
              ],
            ), 
            child: const CustomTextfelid(
              label: 'Phone Number',
              prefixicon: Icons.phone_outlined,
              initialvlaue: '123933939',
              keywordtype: TextInputType.phone,
            ), 
          ), 
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'Save Changes',
                style: AppTextStyle.withColor(
                  AppTextStyle.buttonMedium,
                  Colors.white,
                ),
              ),
            ), 
          ), 
        ],
      ), 
    ); 
  }
}