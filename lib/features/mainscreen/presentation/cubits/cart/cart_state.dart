part of 'cart_cubit.dart';

@immutable
sealed class CartState {
  const CartState();
}

final class CartInitial extends CartState {
  const CartInitial();
}

final class CartLoading extends CartState {
  const CartLoading();
}

final class CartLoaded extends CartState {
  const CartLoaded(this.cart);

  final CartModel cart;
}

final class CartError extends CartState {
  const CartError(this.message);

  final String message;
}
