import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/mainscreen/data/Model/product_model.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/cubits/cubit/product_cubit_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/widget/productcard.dart';

class Productgird extends StatelessWidget {
  const Productgird({super.key, required this.isScroll});

  final bool isScroll;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProductFailure) {
          return Center(child: Text(state.message));
        }
        List<ProductModel> products;
        if (state is ProductSuccess) {
          products = state.products;
        } else if (state is ProductPopularSuccess) {
          products = state.products;
        } else {
          return const SizedBox();
        }
        return GridView.builder(
          physics:
              isScroll
                  ? const AlwaysScrollableScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.75,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        );
      },
    );
  }
}
