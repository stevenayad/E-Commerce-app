import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api_servcies.dart/dio_consumer.dart';
import 'package:flutter_application_1/features/mainscreen/data/Model/product_model.dart';
import 'package:flutter_application_1/features/mainscreen/data/repository/product%20repository/product_repo_implemtation.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/cubits/cubit/product_cubit_cubit.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/widget/productbottomapp.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/widget/productdetailsbody.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Productdetailsview extends StatelessWidget {
  const Productdetailsview({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
            repo: ProductRepoImplemtation(apiConsumer: DioConsumer(Dio())),
          )..getProductById(productModel.id!),
      child: _ProductDetailsShell(initialProduct: productModel),
    );
  }
}

class _ProductDetailsShell extends StatefulWidget {
  const _ProductDetailsShell({required this.initialProduct});

  final ProductModel initialProduct;

  @override
  State<_ProductDetailsShell> createState() => _ProductDetailsShellState();
}

class _ProductDetailsShellState extends State<_ProductDetailsShell> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final productId = widget.initialProduct.id;
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      bottomNavigationBar: productId != null
          ? ProductBottomBar(
              productId: productId,
              quantity: _quantity,
              onQuantityChanged: (q) => setState(() => _quantity = q),
            )
          : null,
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProductFailure) {
            return Center(child: Text(state.message));
          }
          if (state is ProductDetailsSuccess) {
            return Productdetailsbody(product: state.product);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
