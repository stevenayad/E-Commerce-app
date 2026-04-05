part of 'order_cubit.dart';

@immutable
sealed class OrderState {
  const OrderState();
}

final class OrderInitial extends OrderState {
  const OrderInitial();
}

final class OrderSubmitting extends OrderState {
  const OrderSubmitting();
}

final class OrderListLoading extends OrderState {
  const OrderListLoading();
}

final class OrderDetailLoading extends OrderState {
  const OrderDetailLoading();
}

final class OrderCreated extends OrderState {
  const OrderCreated(this.order);

  final OrderModel order;
}

final class OrderListLoaded extends OrderState {
  const OrderListLoaded(this.orders);

  final List<OrderModel> orders;
}

final class OrderDetailLoaded extends OrderState {
  const OrderDetailLoaded(this.order);

  final OrderModel order;
}

final class OrderFailure extends OrderState {
  const OrderFailure(this.message);

  final String message;
}
