import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainscreen/presentation/widget/BuildMenuSection.dart';
import 'package:flutter_application_1/mainscreen/presentation/widget/buildprofilescreen.dart';
import 'package:flutter_application_1/setting/presentation/settingview.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;

class Acounntscreenview extends StatelessWidget {
  const Acounntscreenview({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Account',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => Settingview());
            },
            icon: Icon(
              Icons.settings_outlined,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildprofilesection(),
            SizedBox(height: 10),
            BuildMenuSection(),
          ],
        ),
      ),
    );
  }
}
