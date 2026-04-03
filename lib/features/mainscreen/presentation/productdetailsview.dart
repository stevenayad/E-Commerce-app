import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/mainscreen/Model/product.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/widget/customappbar.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/widget/productbottomapp.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/widget/productdetailsbody.dart';

class Productdetailsview extends StatelessWidget {
  const Productdetailsview({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    final MediaQuer = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: customAppBar(context, product),
      body: Productdetailsbody(product: product),
      bottomNavigationBar: ProductBottomBar(product: product),
    );
  }
}
