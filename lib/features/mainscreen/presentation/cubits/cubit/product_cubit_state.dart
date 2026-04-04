part of 'product_cubit_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductCubitInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<ProductModel> products;

  ProductSuccess({required this.products});
}

class ProductFailure extends ProductState {
  final String message;

  ProductFailure({required this.message});
}

class ProductPopularSuccess extends ProductState {
  final List<ProductModel> products;

  ProductPopularSuccess({required this.products});
}

class ProductDetailsSuccess extends ProductState {
  final ProductModel product;

  ProductDetailsSuccess({required this.product});
}