import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainscreen/Model/product.dart';
import 'package:flutter_application_1/mainscreen/presentation/widget/sizeselector.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

class Productdetailsbody extends StatelessWidget {
  const Productdetailsbody({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final MediaQuer = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Positioned(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    product.isfavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color:
                        product.isfavourite
                            ? Theme.of(context).primaryColor
                            : isDark
                            ? Colors.white
                            : Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Expanded(
                      child: Text(
                        product.name,
                        style: AppTextStyle.withColor(
                          AppTextStyle.h2,
                          Theme.of(context).textTheme.bodyMedium!.color!,
                        ),
                      ),
                    ),
                    Text(
                      product.price.toStringAsFixed(2),
                      style: AppTextStyle.withColor(
                        AppTextStyle.h2,
                        Theme.of(context).textTheme.bodyMedium!.color!,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.category,
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyMedium,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!,
                      ),
                    ),
                    SizedBox(height: MediaQuer.height * 0.01),
                    Text(
                      "Select Size",
                      style: AppTextStyle.withColor(
                        AppTextStyle.labelMedium,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                    const Sizeselector(),
                    SizedBox(height: MediaQuer.height * 0.01),
                    Text(
                      "Descrption",
                      style: AppTextStyle.withColor(
                        AppTextStyle.labelMedium,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                    SizedBox(height: MediaQuer.height * 0.01),
                    Text(
                      product.description,
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodySmall,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!,
                      ),
                    ),
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