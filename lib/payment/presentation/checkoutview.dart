import 'package:flutter/material.dart';
import 'package:flutter_application_1/payment/presentation/orderconformationscreen.dart';
import 'package:flutter_application_1/payment/presentation/widget/addresscard.dart';
import 'package:flutter_application_1/payment/presentation/widget/buildsectiontitle.dart';
import 'package:flutter_application_1/payment/presentation/widget/checkoutbottombar.dart';
import 'package:flutter_application_1/payment/presentation/widget/ordersummarycard.dart';
import 'package:flutter_application_1/payment/presentation/widget/paymentmethodcard.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';

class Checkoutview extends StatelessWidget {
  const Checkoutview({super.key});

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Buildsectiontitle(titel: 'Shipping Address'),
              const SizedBox(height: 16),
              AddresscardPayment(),
              const SizedBox(height: 24),
              Buildsectiontitle(titel: "Payment Method"),
              const SizedBox(height: 16),
              Paymentmethodcard(),
              const SizedBox(height: 24),
              Buildsectiontitle(titel: "Order Summary"),
              const SizedBox(height: 16),
              Ordersummarycard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Checkoutbottombar(
        totalamount: 662.10,
        onplaceorder: () {
          final Ordernumber =
              'ORD${DateTime.now().microsecondsSinceEpoch.toString().substring(7)}';

          Get.to(
            () => Orderconformationscreen(
            
              totalamount: 662.10,
              orderNumber: Ordernumber,
            ),
          );
        },
      ),
    );
  }
}
