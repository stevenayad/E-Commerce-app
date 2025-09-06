import 'package:flutter/material.dart';
import 'package:flutter_application_1/myaccontfeature/Model/ordermodel.dart';
import 'package:flutter_application_1/myaccontfeature/presentation/ordercardview.dart';
import 'package:flutter_application_1/myaccontfeature/presentation/widget/ordercard.dart';

Widget buildorderlist(
  BuildContext context,
  OrderStatus status,
  OrderRepository orderRepository,
) {
  final orders = orderRepository.getorderbystaus(status);
  return ListView.builder(
    itemCount: orders.length,
    itemBuilder: (context, index) {
      final order = orders[index];
      return Ordercard(ordermodel: order, onviewdetils: () {});
    },
  );
}
