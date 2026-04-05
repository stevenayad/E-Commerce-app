import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/cubits/cart/cart_cubit.dart';
import 'package:flutter_application_1/features/payment/presentation/checkoutview.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

Widget buildSummaryorder(BuildContext context) {
  return BlocBuilder<CartCubit, CartState>(
    builder: (context, state) {
      final total = state is CartLoaded ? state.cart.totalPrice : 0.0;
      final unitCount = state is CartLoaded ? state.cart.itemCount : 0;
      final lineCount = state is CartLoaded ? state.cart.items.length : 0;

      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    unitCount == 0
                        ? 'Total'
                        : 'Total ($unitCount items, $lineCount lines)',
                    style: AppTextStyle.withColor(
                      AppTextStyle.bodyMedium,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  Text(
                    '\$${total.toStringAsFixed(2)}',
                    style: AppTextStyle.withColor(
                      AppTextStyle.h2,
                      Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: unitCount == 0
                      ? null
                      : () {
                          Get.to(() => const Checkoutview());
                        },
                  child: Text(
                    'Go To CheckOut',
                    style: AppTextStyle.withColor(
                      AppTextStyle.buttonMedium,
                      Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
