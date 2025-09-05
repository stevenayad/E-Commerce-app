import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainscreen/Model/product.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

Widget buildwishlistitem(BuildContext context, Product product) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return Container(
    margin: EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color:
              isDark
                  ? Colors.black.withOpacity(0.2)
                  : Colors.grey.withOpacity(0.1),
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.horizontal(
            left: Radius.circular(12),
          ),
          child: Image.asset(
            product.imageUrl,
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: AppTextStyle.withColor(
                    AppTextStyle.bodyLarge,
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                ),
                Text(
                  product.category,
                  style: AppTextStyle.withColor(
                    AppTextStyle.bodySmall,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.price.toStringAsFixed(2),
                      style: AppTextStyle.withColor(
                        AppTextStyle.h3,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete_outlined,
                            color: isDark ? Colors.grey[400]! : Colors.grey[600]! ,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
