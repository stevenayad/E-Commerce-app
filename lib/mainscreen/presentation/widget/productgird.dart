import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainscreen/Model/product.dart';
import 'package:flutter_application_1/mainscreen/presentation/productdetailsview.dart';
import 'package:flutter_application_1/mainscreen/presentation/widget/productcard.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Productgird extends StatelessWidget {
  const Productgird({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Productdetailsview(product: product),
              ),
            );
          },
          child: ProductCard(product: product),
        );
      },
    );
  }
}
