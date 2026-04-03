enum OrderStatus { active, completed, cancelled }

class Ordermodel {
  final int itemCount;
  final String orderNumber;
  final double totalAmount;
  final OrderStatus status;
  final String imageUrl;
  final DateTime orderDate;

  Ordermodel({
    required this.itemCount,
    required this.orderNumber,
    required this.totalAmount,
    required this.status,
    required this.imageUrl,
    required this.orderDate,
  });
}

class OrderRepository {
  List<Ordermodel> getOrders() {
    return [
      Ordermodel(
        orderNumber: '123432',
        itemCount: 2,
        totalAmount: 2938.3,
        status: OrderStatus.active,
        imageUrl: 'assets/images/shoe.jpg',
        orderDate: DateTime.now().subtract(const Duration(hours: 2)),
      ), // Order
      Ordermodel(
        orderNumber: '322422',
        itemCount: 1,
        totalAmount: 432.3,
        status: OrderStatus.active,
        imageUrl: 'assets/images/laptop.jpg',
        orderDate: DateTime.now().subtract(const Duration(hours: 1)),
      ), 
      Ordermodel(
        orderNumber: '64353',
        itemCount: 2,
        totalAmount: 32.3,
        status: OrderStatus.completed,
        imageUrl: 'assets/images/shoe2.jpg',
        orderDate: DateTime.now().subtract(const Duration(hours: 3)),
      ), 
      Ordermodel(
        orderNumber: '25242',
        itemCount: 5,
        totalAmount: 4932.3,
        status: OrderStatus.cancelled,
        imageUrl: 'assets/images/shoe2.jpg',
        orderDate: DateTime.now().subtract(const Duration(hours: 7)),
      ), 
    ];
  }

  List<Ordermodel> getorderbystaus(OrderStatus status) {
    return getOrders().where((order) => order.status == status).toList();
  }
}
