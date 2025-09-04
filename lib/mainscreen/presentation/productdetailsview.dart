import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainscreen/Model/product.dart';
import 'package:flutter_application_1/mainscreen/presentation/widget/customappbar.dart';
import 'package:flutter_application_1/mainscreen/presentation/widget/productbottomapp.dart';
class Productdetailsview extends StatelessWidget {
  const Productdetailsview({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    final MediaQuer = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: customAppBar(context, product),
      body: Productdetailsview(product: product),
      bottomNavigationBar: ProductBottomBar(product: product),
    );
  }
}
