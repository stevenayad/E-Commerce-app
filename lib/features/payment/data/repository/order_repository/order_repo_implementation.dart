import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/api_servcies.dart/api_consumer.dart';
import 'package:flutter_application_1/core/api_servcies.dart/failure.dart';
import 'package:flutter_application_1/features/payment/data/Model/order_model.dart';
import 'package:flutter_application_1/features/payment/data/repository/order_repository/order_checkout_request.dart';
import 'package:flutter_application_1/features/payment/data/repository/order_repository/order_repo.dart';

class OrderRepoImplementation implements OrderRepo {
  OrderRepoImplementation({required this.apiConsumer});

  final ApiConsumer apiConsumer;

  @override
  Future<Either<Failure, OrderModel>> createOrder(
    OrderCheckoutRequest request,
  ) async {
    try {
      final response = await apiConsumer.post(
        'orders/new/',
        request.toJson(),
        false,
      );
      if (response == null || response is! Map<String, dynamic>) {
        return Left(ServiveFailure('Invalid server response'));
      }
      final orderJson = response['order'] ?? response;
      if (orderJson is! Map<String, dynamic>) {
        return Left(ServiveFailure('Invalid server response'));
      }
      return Right(OrderModel.fromJson(orderJson));
    } on DioException catch (e) {
      return Left(ServiveFailure.fromDioError(e));
    } catch (e) {
      return Left(ServiveFailure('Unexpected error, please try again'));
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders() async {
    try {
      final response = await apiConsumer.get('orders/');
      if (response == null || response is! Map<String, dynamic>) {
        return Left(ServiveFailure('Invalid server response'));
      }
      final raw = response['orders'];
      if (raw is! List) {
        return Left(ServiveFailure('Invalid server response'));
      }
      final list = <OrderModel>[];
      for (final e in raw) {
        if (e is Map<String, dynamic>) {
          list.add(OrderModel.fromJson(e));
        }
      }
      return Right(list);
    } on DioException catch (e) {
      return Left(ServiveFailure.fromDioError(e));
    } catch (e) {
      return Left(ServiveFailure('Unexpected error, please try again'));
    }
  }

  @override
  Future<Either<Failure, OrderModel>> getOrderById(int id) async {
    try {
      final response = await apiConsumer.get('orders/$id/');
      if (response == null || response is! Map<String, dynamic>) {
        return Left(ServiveFailure('Invalid server response'));
      }
      final orderJson = response['order'];
      if (orderJson is! Map<String, dynamic>) {
        return Left(ServiveFailure('Invalid server response'));
      }
      return Right(OrderModel.fromJson(orderJson));
    } on DioException catch (e) {
      return Left(ServiveFailure.fromDioError(e));
    } catch (e) {
      return Left(ServiveFailure('Unexpected error, please try again'));
    }
  }
}
