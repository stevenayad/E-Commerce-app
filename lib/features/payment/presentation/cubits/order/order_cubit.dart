import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/features/payment/data/Model/order_model.dart';
import 'package:flutter_application_1/features/payment/data/repository/order_repository/order_checkout_request.dart';
import 'package:flutter_application_1/features/payment/data/repository/order_repository/order_repo.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit({required this.repo}) : super(const OrderInitial());

  final OrderRepo repo;

  Future<void> createOrder(OrderCheckoutRequest request) async {
    emit(const OrderSubmitting());
    final result = await repo.createOrder(request);
    result.fold(
      (f) => emit(OrderFailure(f.errMessage)),
      (order) => emit(OrderCreated(order)),
    );
  }

  Future<void> fetchOrders() async {
    emit(const OrderListLoading());
    final result = await repo.getOrders();
    result.fold(
      (f) => emit(OrderFailure(f.errMessage)),
      (orders) => emit(OrderListLoaded(orders)),
    );
  }

  Future<void> fetchOrderById(int id) async {
    emit(const OrderDetailLoading());
    final result = await repo.getOrderById(id);
    result.fold(
      (f) => emit(OrderFailure(f.errMessage)),
      (order) => emit(OrderDetailLoaded(order)),
    );
  }
}
