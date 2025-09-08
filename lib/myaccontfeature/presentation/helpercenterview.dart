import 'package:flutter/material.dart';
import 'package:flutter_application_1/myaccontfeature/presentation/widget/buildtextfeildhelper.dart';
import 'package:flutter_application_1/myaccontfeature/presentation/widget/popularquestionsection.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Helpercenterview extends StatelessWidget {
  const Helpercenterview({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(4),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: buildtextfeildhelper(context),
            ),
            popluarquestionsection(),
          ],
        ),
      ),
    );
  }
}
