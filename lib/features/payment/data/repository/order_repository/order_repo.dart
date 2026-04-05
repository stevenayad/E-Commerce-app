import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/api_servcies.dart/failure.dart';
import 'package:flutter_application_1/features/payment/data/Model/order_model.dart';
import 'package:flutter_application_1/features/payment/data/repository/order_repository/order_checkout_request.dart';

abstract class OrderRepo {
  Future<Either<Failure, OrderModel>> createOrder(OrderCheckoutRequest request);

  Future<Either<Failure, List<OrderModel>>> getOrders();

  Future<Either<Failure, OrderModel>> getOrderById(int id);
}
