import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/features/mainscreen/data/Model/cart_model.dart';
import 'package:flutter_application_1/features/mainscreen/data/repository/cart_repository/cart_repo.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.repo}) : super(const CartInitial());

  final CartRepo repo;

  Future<void> loadCart({bool showLoading = true}) async {
    if (showLoading) emit(const CartLoading());
    final result = await repo.getCart();
    result.fold(
      (f) => emit(CartError(f.errMessage)),
      (cart) => emit(CartLoaded(cart)),
    );
  }

  Future<void> addToCart({required int productId, int quantity = 1}) async {
    final result = await repo.addToCart(
      productId: productId,
      quantity: quantity,
    );
    await result.fold(
      (f) async {
        emit(CartError(f.errMessage));
        await loadCart(showLoading: false);
      },
      (_) async => loadCart(showLoading: false),
    );
  }

  Future<void> updateQuantity(int itemId, int quantity) async {
    if (quantity < 1) return;
    final result = await repo.updateCartItem(itemId: itemId, quantity: quantity);
    await result.fold(
      (f) async {
        emit(CartError(f.errMessage));
        await loadCart(showLoading: false);
      },
      (_) async => loadCart(showLoading: false),
    );
  }

  Future<void> removeItem(int itemId) async {
    final result = await repo.removeCartItem(itemId);
    await result.fold(
      (f) async {
        emit(CartError(f.errMessage));
        await loadCart(showLoading: false);
      },
      (_) async => loadCart(showLoading: false),
    );
  }

  Future<void> clearCart() async {
    final result = await repo.clearCart();
    await result.fold(
      (f) async {
        emit(CartError(f.errMessage));
        await loadCart(showLoading: false);
      },
      (_) async => loadCart(showLoading: false),
    );
  }

  void applyCart(CartModel cart) {
    emit(CartLoaded(cart));
  }
}
