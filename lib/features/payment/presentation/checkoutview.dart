import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api_servcies.dart/dio_consumer.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/cubits/cart/cart_cubit.dart';
import 'package:flutter_application_1/features/payment/data/repository/order_repository/order_checkout_request.dart';
import 'package:flutter_application_1/features/payment/data/repository/order_repository/order_repo_implementation.dart';
import 'package:flutter_application_1/features/payment/presentation/orderconformationscreen.dart';
import 'package:flutter_application_1/features/payment/presentation/widget/buildsectiontitle.dart';
import 'package:flutter_application_1/features/payment/presentation/widget/checkoutbottombar.dart';
import 'package:flutter_application_1/features/payment/presentation/widget/ordersummarycard.dart';
import 'package:flutter_application_1/features/payment/presentation/widget/paymentmethodcard.dart';
import 'package:flutter_application_1/features/payment/presentation/cubits/order/order_cubit.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Checkoutview extends StatefulWidget {
  const Checkoutview({super.key});

  @override
  State<Checkoutview> createState() => _CheckoutviewState();
}

class _CheckoutviewState extends State<Checkoutview> {
  final _formKey = GlobalKey<FormState>();
  final _city = TextEditingController(text: 'Cairo');
  final _zip = TextEditingController(text: '12345');
  final _street = TextEditingController(text: 'Nasr City');
  final _phone = TextEditingController(text: '0100000000');
  final _country = TextEditingController(text: 'Egypt');
  final _state = TextEditingController();

  @override
  void dispose() {
    _city.dispose();
    _zip.dispose();
    _street.dispose();
    _phone.dispose();
    _country.dispose();
    _state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocProvider(
      create: (_) => OrderCubit(
            repo: OrderRepoImplementation(
              apiConsumer: DioConsumer(Dio()),
            ),
          ),
      child: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) async {
          if (state is OrderCreated) {
            await context.read<CartCubit>().loadCart(showLoading: false);
            if (!context.mounted) return;
            Get.off(
              () => Orderconformationscreen(
                orderNumber: '#${state.order.id}',
                totalamount: state.order.totalAmount,
              ),
            );
          }
          if (state is OrderFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, orderState) {
          final submitting = orderState is OrderSubmitting;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Checkout',
                style: AppTextStyle.withColor(
                  AppTextStyle.h3,
                  isDark ? Colors.white : Colors.black,
                ),
              ),
              leading: IconButton(
                onPressed: submitting ? null : Get.back,
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Buildsectiontitle(titel: 'Shipping Address'),
                          const SizedBox(height: 16),
                          _checkoutTextField(
                            context,
                            label: 'City',
                            controller: _city,
                          ),
                          _checkoutTextField(
                            context,
                            label: 'ZIP code',
                            controller: _zip,
                          ),
                          _checkoutTextField(
                            context,
                            label: 'Street',
                            controller: _street,
                          ),
                          _checkoutTextField(
                            context,
                            label: 'Phone',
                            controller: _phone,
                            keyboardType: TextInputType.phone,
                          ),
                          _checkoutTextField(
                            context,
                            label: 'Country',
                            controller: _country,
                          ),
                          _checkoutTextField(
                            context,
                            label: 'State (optional)',
                            controller: _state,
                            requiredField: false,
                          ),
                          const SizedBox(height: 24),
                          const Buildsectiontitle(titel: 'Payment Method'),
                          const SizedBox(height: 16),
                          const Paymentmethodcard(),
                          const SizedBox(height: 24),
                          const Buildsectiontitle(titel: 'Order Summary'),
                          const SizedBox(height: 16),
                          const Ordersummarycard(),
                        ],
                      ),
                    ),
                  ),
                ),
                if (submitting)
                  const ColoredBox(
                    color: Color(0x33000000),
                    child: Center(child: CircularProgressIndicator()),
                  ),
              ],
            ),
            bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
              builder: (context, cartState) {
                final total = cartState is CartLoaded
                    ? cartState.cart.totalPrice
                    : 0.0;
                return Checkoutbottombar(
                  totalamount: total,
                  onplaceorder: submitting
                      ? () {}
                      : () {
                          if (!_formKey.currentState!.validate()) return;
                          final request = OrderCheckoutRequest(
                            city: _city.text.trim(),
                            zipCode: _zip.text.trim(),
                            street: _street.text.trim(),
                            phoneNo: _phone.text.trim(),
                            country: _country.text.trim(),
                            state: _state.text.trim(),
                          );
                          context.read<OrderCubit>().createOrder(request);
                        },
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _checkoutTextField(
    BuildContext context, {
    required String label,
    required TextEditingController controller,
    TextInputType? keyboardType,
    bool requiredField = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: (v) {
          if (!requiredField) return null;
          if (v == null || v.trim().isEmpty) {
            return 'Required';
          }
          return null;
        },
      ),
    );
  }
}
