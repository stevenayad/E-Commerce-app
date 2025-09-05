import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainscreen/Model/product.dart';
import 'package:flutter_application_1/mainscreen/presentation/widget/buildcartitem.dart';
import 'package:flutter_application_1/mainscreen/presentation/widget/buildsummaryorder.dart';
import 'package:flutter_application_1/mainscreen/presentation/widget/showdailogdelteitem.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:flutter_application_1/utilis/apptheme.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/http/interface/request_base.dart';
import 'package:get/get_core/src/get_main.dart';

class Mycartview extends StatelessWidget {
  const Mycartview({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'My Card',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: Mycartbody(),
    );
  }
}

class Mycartbody extends StatelessWidget {
  const Mycartbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(6),
            itemCount: products.length,
            itemBuilder: (builder, index) {
              final product = products[index];
              return buildCartItem(context, product);
            },
          ),
        ),
        buildSummaryorder(context),
      ],
    );
  }
}
