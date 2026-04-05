import 'package:flutter_application_1/core/api_servcies.dart/api_response_parser.dart';
import 'package:flutter_application_1/features/payment/data/Model/order_item_model.dart';

class OrderModel {
  final int id;
  final int user;
  final String city;
  final String zipCode;
  final String street;
  final String phoneNo;
  final String country;
  final String state;
  final double totalAmount;
  final List<OrderItemModel> orderItems;

  const OrderModel({
    required this.id,
    required this.user,
    required this.city,
    required this.zipCode,
    required this.street,
    required this.phoneNo,
    required this.country,
    required this.state,
    required this.totalAmount,
    required this.orderItems,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    final raw = json['orderItems'] ?? json['order_items'];
    final list = <OrderItemModel>[];
    if (raw is List) {
      for (final e in raw) {
        if (e is Map<String, dynamic>) {
          list.add(OrderItemModel.fromJson(e));
        }
      }
    }
    return OrderModel(
      id: json['id'] as int,
      user: json['user'] as int,
      city: json['city'] as String? ?? '',
      zipCode: json['zip_code'] as String? ?? '',
      street: json['street'] as String? ?? '',
      phoneNo: json['phone_no'] as String? ?? '',
      country: json['country'] as String? ?? '',
      state: json['state'] as String? ?? '',
      totalAmount: parsePriceToDouble(json['total_amount']),
      orderItems: list,
    );
  }
}
