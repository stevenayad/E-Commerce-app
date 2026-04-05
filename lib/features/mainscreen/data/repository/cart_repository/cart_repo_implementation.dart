import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/api_servcies.dart/api_consumer.dart';
import 'package:flutter_application_1/core/api_servcies.dart/api_response_parser.dart';
import 'package:flutter_application_1/core/api_servcies.dart/failure.dart';
import 'package:flutter_application_1/features/mainscreen/data/Model/cart_item_model.dart';
import 'package:flutter_application_1/features/mainscreen/data/Model/cart_model.dart';
import 'package:flutter_application_1/features/mainscreen/data/repository/cart_repository/cart_repo.dart';

class CartRepoImplementation implements CartRepo {
  CartRepoImplementation({required this.apiConsumer});

  final ApiConsumer apiConsumer;

  @override
  Future<Either<Failure, CartItemModel>> addToCart({
    required int productId,
    required int quantity,
  }) async {
    try {
      final response = await apiConsumer.post(
        'cart/add/',
        {'product_id': productId, 'quantity': quantity},
        false,
      );
      if (response == null || response is! Map<String, dynamic>) {
        return Left(ServiveFailure('Invalid server response'));
      }
      if (response.containsKey('error')) {
        return Left(
          ServiveFailure(
            parseBackendErrorMessage(response) ?? 'Could not add to cart',
          ),
        );
      }
      return Right(CartItemModel.fromJson(response));
    } on DioException catch (e) {
      return Left(ServiveFailure.fromDioError(e));
    } catch (e) {
      return Left(ServiveFailure('Unexpected error, please try again'));
    }
  }

  @override
  Future<Either<Failure, CartModel>> getCart() async {
    try {
      final response = await apiConsumer.get('cart/');
      if (response == null || response is! Map<String, dynamic>) {
        return Left(ServiveFailure('Invalid server response'));
      }
      return Right(CartModel.fromJson(response));
    } on DioException catch (e) {
      return Left(ServiveFailure.fromDioError(e));
    } catch (e) {
      return Left(ServiveFailure('Unexpected error, please try again'));
    }
  }

  @override
  Future<Either<Failure, CartItemModel>> updateCartItem({
    required int itemId,
    required int quantity,
  }) async {
    try {
      final response = await apiConsumer.put(
        'cart/update/$itemId/',
        {'quantity': quantity},
      );
      if (response == null || response is! Map<String, dynamic>) {
        return Left(ServiveFailure('Invalid server response'));
      }
      return Right(CartItemModel.fromJson(response));
    } on DioException catch (e) {
      return Left(ServiveFailure.fromDioError(e));
    } catch (e) {
      return Left(ServiveFailure('Unexpected error, please try again'));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeCartItem(int itemId) async {
    try {
      await apiConsumer.delete('cart/remove/$itemId/', null);
      return const Right(unit);
    } on DioException catch (e) {
      return Left(ServiveFailure.fromDioError(e));
    } catch (e) {
      return Left(ServiveFailure('Unexpected error, please try again'));
    }
  }

  @override
  Future<Either<Failure, Unit>> clearCart() async {
    try {
      await apiConsumer.delete('cart/clear/', null);
      return const Right(unit);
    } on DioException catch (e) {
      return Left(ServiveFailure.fromDioError(e));
    } catch (e) {
      return Left(ServiveFailure('Unexpected error, please try again'));
    }
  }
}
