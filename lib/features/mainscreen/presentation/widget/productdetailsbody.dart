import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/mainscreen/data/Model/product_model.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/widget/sizeselector.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

class Productdetailsbody extends StatelessWidget {
  const Productdetailsbody({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    // ✅ parse price
    final double price =
        double.tryParse(product.price ?? "0") ?? 0;

    // ✅ handle image
    final String imageUrl =
        (product.image != null && product.image!.isNotEmpty)
            ? "http://127.0.0.1:8000${product.image}"
            : "https://via.placeholder.com/300";

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔥 Image Section
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported),
                ),
              ),

              // ❤️ Favorite (static)
              Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.favorite_border,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),

          // 🔽 Details
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Name + Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        product.name ?? "",
                        style: AppTextStyle.withColor(
                          AppTextStyle.h2,
                          Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .color!,
                        ),
                      ),
                    ),
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: AppTextStyle.withColor(
                        AppTextStyle.h2,
                        Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .color!,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: size.height * 0.01),

                // 🔹 Category
                Text(
                  product.category ?? "",
                  style: AppTextStyle.withColor(
                    AppTextStyle.bodyMedium,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                ),

                SizedBox(height: size.height * 0.02),

                // 🔹 Size
                Text(
                  "Select Size",
                  style: AppTextStyle.withColor(
                    AppTextStyle.labelMedium,
                    Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!,
                  ),
                ),

                const Sizeselector(),

                SizedBox(height: size.height * 0.02),

                // 🔹 Description
                Text(
                  "Description",
                  style: AppTextStyle.withColor(
                    AppTextStyle.labelMedium,
                    Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!,
                  ),
                ),

                SizedBox(height: size.height * 0.01),

                Text(
                  product.description ?? "",
                  style: AppTextStyle.withColor(
                    AppTextStyle.bodySmall,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}