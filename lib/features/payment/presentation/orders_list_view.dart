import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api_servcies.dart/dio_consumer.dart';
import 'package:flutter_application_1/features/payment/data/repository/order_repository/order_repo_implementation.dart';
import 'package:flutter_application_1/features/payment/presentation/cubits/order/order_cubit.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

/// Lists orders from `GET /orders/` (Payment feature area).
class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocProvider(
      create: (_) => OrderCubit(
            repo: OrderRepoImplementation(apiConsumer: DioConsumer(Dio())),
          )..fetchOrders(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: Get.back,
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            'My Orders',
            style: AppTextStyle.withColor(
              AppTextStyle.h3,
              isDark ? Colors.white : Colors.black,
            ),
          ),
        ),
        body: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            if (state is OrderListLoading || state is OrderInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is OrderFailure) {
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
                            context.read<OrderCubit>().fetchOrders(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is OrderListLoaded) {
              if (state.orders.isEmpty) {
                return const Center(child: Text('No orders yet'));
              }
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: state.orders.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final o = state.orders[index];
                  return Card(
                    child: ListTile(
                      title: Text('Order #${o.id}'),
                      subtitle: Text(
                        '${o.street}, ${o.city} — ${o.phoneNo}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(
                        '\$${o.totalAmount.toStringAsFixed(2)}',
                        style: AppTextStyle.withColor(
                          AppTextStyle.bodyLarge,
                          Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
