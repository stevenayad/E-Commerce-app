import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/api_servcies.dart/failure.dart';
import 'package:flutter_application_1/features/mainscreen/data/Model/cart_item_model.dart';
import 'package:flutter_application_1/features/mainscreen/data/Model/cart_model.dart';

abstract class CartRepo {
  Future<Either<Failure, CartItemModel>> addToCart({
    required int productId,
    required int quantity,
  });

  Future<Either<Failure, CartModel>> getCart();

  Future<Either<Failure, CartItemModel>> updateCartItem({
    required int itemId,
    required int quantity,
  });

  Future<Either<Failure, Unit>> removeCartItem(int itemId);

  Future<Either<Failure, Unit>> clearCart();
}
