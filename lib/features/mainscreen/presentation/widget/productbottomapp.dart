import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/cubits/cart/cart_cubit.dart';
import 'package:flutter_application_1/features/payment/presentation/checkoutview.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ProductBottomBar extends StatelessWidget {
  const ProductBottomBar({
    super.key,
    required this.productId,
    required this.quantity,
    required this.onQuantityChanged,
  });

  final int productId;
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: quantity > 1
                      ? () => onQuantityChanged(quantity - 1)
                      : null,
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Text(
                  '$quantity',
                  style: AppTextStyle.withColor(
                    AppTextStyle.bodyLarge,
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                ),
                IconButton(
                  onPressed: () => onQuantityChanged(quantity + 1),
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () async {
                      await context.read<CartCubit>().addToCart(
                            productId: productId,
                            quantity: quantity,
                          );
                      if (!context.mounted) return;
                      final s = context.read<CartCubit>().state;
                      final messenger = ScaffoldMessenger.of(context);
                      if (s is CartLoaded) {
                        messenger.showSnackBar(
                          const SnackBar(content: Text('Added to cart')),
                        );
                      } else if (s is CartError) {
                        messenger.showSnackBar(
                          SnackBar(content: Text(s.message)),
                        );
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: mediaQuery.height * 0.02,
                      ),
                      side: BorderSide(
                        color: isDark ? Colors.white70 : Colors.black12,
                      ),
                    ),
                    child: Text(
                      'Add to Cart',
                      style: AppTextStyle.withColor(
                        AppTextStyle.buttonMedium,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: mediaQuery.width * 0.03),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const Checkoutview());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: mediaQuery.height * 0.02,
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      'Buy Now',
                      style: AppTextStyle.withColor(
                        AppTextStyle.buttonMedium,
                        Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
