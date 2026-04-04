import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/features/mainscreen/data/Model/product_model.dart';
import 'package:flutter_application_1/features/mainscreen/data/repository/product%20repository/product_repo.dart';
import 'package:meta/meta.dart';

part 'product_cubit_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final product_repo repo;
  ProductCubit({required this.repo}) : super(ProductCubitInitial());
  Future<void> getAllProducts() async {
    emit(ProductLoading());

    final result = await repo.getallitem();

    result.fold(
      (failure) {
        emit(ProductFailure(message: failure.errMessage));
      },
      (products) {
        emit(ProductSuccess(products: products));
      },
    );
  }

  Future<void> getProductsByCategory(String category) async {
    emit(ProductLoading());

    final result = await repo.getitemByCategory(category);

    result.fold(
      (failure) => emit(ProductFailure(message: failure.errMessage)),
      (products) => emit(ProductSuccess(products: products)),
    );
  }

  Future<void> getPopularProduct() async {
    emit(ProductLoading());

    final result = await repo.getpopularproduct();

    result.fold(
      (failure) => emit(ProductFailure(message: failure.errMessage)),
      (products) => emit(ProductPopularSuccess(products: products)),
    );
  }
   
   Future<void> getProductById(int id) async {
  emit(ProductLoading());

  final result = await repo.getproductbyid(id);

  result.fold(
    (failure) {
      emit(ProductFailure(message: failure.errMessage));
    },
    (product) {
      emit(ProductDetailsSuccess(product: product));
    },
  );
}
Future<void> getProductBySearch(String name) async {
    emit(ProductLoading());

    final result = await repo.getproductbysearch(name);

    result.fold(
      (failure) => emit(ProductFailure(message: failure.errMessage)),
      (products) => emit(ProductSuccess(products: products)),
    );
  }
}
