import 'package:flutter/material.dart';
import 'package:flutter_application_1/myaccontfeature/presentation/widget/ProfileImage.dart';
import 'package:flutter_application_1/myaccontfeature/presentation/widget/profileform.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Editprofileview extends StatelessWidget {
  const Editprofileview({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Order Screen',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [SizedBox(height: 24), Profileimage(), ProfileForm()],
        ),
      ),
    );
  }
}
