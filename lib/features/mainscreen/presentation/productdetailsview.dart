import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api_servcies.dart/dio_consumer.dart';
import 'package:flutter_application_1/features/mainscreen/data/Model/product_model.dart';
import 'package:flutter_application_1/features/mainscreen/data/repository/product%20repository/product_repo_implemtation.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/cubits/cubit/product_cubit_cubit.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/widget/productbottomapp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/widget/productdetailsbody.dart';

class Productdetailsview extends StatelessWidget {
  const Productdetailsview({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ProductCubit(
            repo: ProductRepoImplemtation(apiConsumer: DioConsumer(Dio())),
          )..getProductById(productModel.id!),

      child: Scaffold(
        appBar: AppBar(title: const Text("Product Details")),
        bottomNavigationBar: ProductBottomBar(),
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            // 🔄 loading
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // ❌ error
            if (state is ProductFailure) {
              return Center(child: Text(state.message));
            }

            // ✅ success
            if (state is ProductDetailsSuccess) {
              return Productdetailsbody(product: state.product);
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
