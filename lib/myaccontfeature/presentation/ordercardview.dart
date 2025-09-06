import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainscreen/Model/product.dart';
import 'package:flutter_application_1/myaccontfeature/Model/ordermodel.dart';
import 'package:flutter_application_1/myaccontfeature/presentation/widget/buildorderlist.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Ordercardview extends StatelessWidget {
  const Ordercardview({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderRepository orderRepository = OrderRepository();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
          bottom: TabBar(
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: isDark ? Colors.grey[400] : Colors.grey[600],
            tabs: [
              Tab(text: 'Active'),
              Tab(text: 'Completed'),
              Tab(text: 'Cancled'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildorderlist(context, OrderStatus.active, orderRepository),
            buildorderlist(context, OrderStatus.completed, orderRepository),
            buildorderlist(context, OrderStatus.cancelled, orderRepository),
          ],
        ),
      ),
    );
  }
}
