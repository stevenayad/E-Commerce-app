import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainscreen/Model/product.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainscreen/Model/product.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

class Productgird extends StatelessWidget {
  const Productgird({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75, // Modified aspect ratio
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {},
            child: ProductCard(product: product),
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      constraints: BoxConstraints(maxWidth: width * 0.9),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color:
                isDark
                    ? Colors.black.withOpacity(0.3)
                    : Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    product.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    // height: 100,
                  ),
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    product.isfavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  color:
                      product.isfavourite
                          ? Theme.of(context).primaryColor
                          : isDark
                          ? Colors.grey[400]
                          : Colors.grey[600],
                ),
              ),
              // if (product.oldPrice != null)
              Positioned(
                left: 8,
                top: 8,
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Text(
                    '${(((product.oldPrice - product.price) / product.oldPrice) * 100).round()}',
                    style: AppTextStyle.withColor(
                      AppTextStyle.withWeight(
                        AppTextStyle.bodySmall,
                        FontWeight.bold,
                      ),
                      Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          //product Details
          Padding(
            padding: EdgeInsets.all(width * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: AppTextStyle.withColor(
                    AppTextStyle.withWeight(AppTextStyle.h3, FontWeight.bold),
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: width * 0.01),
                Text(
                  product.category,
                  style: AppTextStyle.withColor(
                    AppTextStyle.bodyMedium,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                ),
                SizedBox(height: width * 0.01),
                Row(
                  children: [
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: AppTextStyle.withColor(
                        AppTextStyle.withWeight(
                          AppTextStyle.bodyLarge,
                          FontWeight.bold,
                        ),
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                    if (product.oldPrice != null) ...[
                      SizedBox(width: width * 0.01),
                      Text(
                        '\$${product.oldPrice!.toStringAsFixed(2)}',
                        style: AppTextStyle.withColor(
                          AppTextStyle.bodySmall,
                          isDark ? Colors.grey[400]! : Colors.grey[600]!,
                        ).copyWith(decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
