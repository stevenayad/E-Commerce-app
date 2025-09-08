import 'package:flutter/material.dart';
import 'package:flutter_application_1/setting/presentation/privacypolicyview.dart';
import 'package:flutter_application_1/setting/presentation/termservices.dart';
import 'package:flutter_application_1/setting/presentation/widget/buildnavgation.dart';
import 'package:flutter_application_1/setting/presentation/widget/buildsection.dart';
import 'package:flutter_application_1/setting/presentation/widget/buildswitchtitle.dart';
import 'package:flutter_application_1/setting/presentation/widget/buildthemetoggle.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Settingview extends StatelessWidget {
  const Settingview({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildsection(context, 'Appearance', [buildthemetoggle(context)]),
            buildsection(context, 'Notification', [
              buildSwitchtitle(
                context,
                "Push Notification",
                "Recieve Push Notification  about order",
                true,
              ),
              buildSwitchtitle(
                context,
                "Email Notification",
                "Recieve Email Updates  about  your order",
                false,
              ),
            ]),
            buildsection(context, 'Privacy', [
              buildNavagationtitle(
                context,
                "Privacy Policy",
                "View  Our privacy policy ",
                Icons.privacy_tip_outlined,
                onTap: () {
                  Get.to(() => Privacypolicyview());
                },
              ),
              buildNavagationtitle(
                context,
                "Terms of Services",
                "Read our terms of tervices",
                Icons.description_outlined,
                onTap: () {
                  Get.to(() => Termservices());
                },
              ),
            ]),
            buildsection(context, 'About', [
              buildNavagationtitle(
                context,
                "App version",
                "1.0.0",
                Icons.privacy_tip_outlined,
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
