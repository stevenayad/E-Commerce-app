import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/cubits/cart/cart_cubit.dart';
import 'package:flutter_application_1/features/payment/presentation/widget/buildsummaryrow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ordersummarycard extends StatelessWidget {
  const Ordersummarycard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final total = state is CartLoaded ? state.cart.totalPrice : 0.0;
        final subLabel = state is CartLoaded && state.cart.items.isNotEmpty
            ? '${state.cart.itemCount} items'
            : '—';

        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withOpacity(0.1)
                    : Colors.grey.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              buildSummaryRow(context, 'Subtotal ($subLabel)',
                  '\$${total.toStringAsFixed(2)}', false),
              buildSummaryRow(context, 'Shipping', '\$0.00', false),
              buildSummaryRow(context, 'Tax', '\$0.00', false),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Divider(),
              ),
              buildSummaryRow(
                context,
                'Total',
                '\$${total.toStringAsFixed(2)}',
                true,
              ),
            ],
          ),
        );
      },
    );
  }
}
