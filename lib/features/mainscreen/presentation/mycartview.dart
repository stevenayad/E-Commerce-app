import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/widget/buildcartitem.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/widget/buildsummaryorder.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/cubits/cart/cart_cubit.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Mycartview extends StatefulWidget {
  const Mycartview({super.key});

  @override
  State<Mycartview> createState() => _MycartviewState();
}

class _MycartviewState extends State<Mycartview> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().loadCart();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: Get.back,
        ),
        title: Text(
          'My Cart',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: BlocConsumer<CartCubit, CartState>(
        listenWhen: (prev, next) => next is CartError,
        listener: (context, state) {
          if (state is CartError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is CartLoading || state is CartInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CartLoaded && state.cart.items.isEmpty) {
            return Center(
              child: Text(
                'Your cart is empty',
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyLarge,
                  Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
                ),
              ),
            );
          }
          if (state is CartLoaded) {
            final cart = state.cart;
            final cubit = context.read<CartCubit>();
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(6),
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return buildCartItem(
                        context,
                        item: item,
                        onIncrement: () => cubit.updateQuantity(
                          item.id,
                          item.quantity + 1,
                        ),
                        onDecrement: () => cubit.updateQuantity(
                          item.id,
                          item.quantity - 1,
                        ),
                        onRemove: () => cubit.removeItem(item.id),
                      );
                    },
                  ),
                ),
                buildSummaryorder(context),
              ],
            );
          }
          if (state is CartError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message, textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () =>
                          context.read<CartCubit>().loadCart(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
